import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'dart:math';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'temp_phone.dart';

var ppressure = [];
var ptemperature = [];
var ptemp_con = <double>[];
var ppress_con = <double>[];
var ptime_con_press = <con_tem>[];
var ptime_con_tem = <con_tem>[];
var ptime = [];
var pttime = [];
var pcs1 = [];
var pcs2 = [];
var pl_status_list = [];
var pg_leak_list = [];
double ptem = 20;
String psta = 'Analysing...';
String ppsta = 'Analysing...';
double ppress = 1000;

class pdash extends StatefulWidget {
  const pdash({super.key});

  @override
  State<pdash> createState() => _pdashState();
}

class _pdashState extends State<pdash> {
  bool l_status = true, g_leak = false;
  Future? ran() async {
    while (true) {
      await Future.delayed(Duration(seconds: 20));

      int min = 2000;
      int max = 4000;
      int r = min + Random().nextInt(max - min);

      setState(() {
        ppress = r.toDouble();

        ptem = Random().nextInt(50) + 1.toDouble();
      });

      //pressure Condition
      if (ppress < 3150) {
        pl_status_list.add(l_status);
        pg_leak_list.add(g_leak);
        setState(() {});
        psta = "Abnormal";
        FloatingSnackBar(
            backgroundColor: Colors.blue,
            message: "Abnormal Pressure : $ppress Psi",
            context: context);
        DateTime now = new DateTime.now();
        ptime.add(now);
        pcs1.add(psta);
        ppressure.add(ppress);
        ppress_con.add(ppress.toDouble());
        int hour = now.hour;
        int min = now.minute;
        con_tem val = con_tem("$hour : $min", ppress.toDouble());
        ptime_con_press.add(val);
      } else if (3250 < ppress) {
        pl_status_list.add(l_status);
        pg_leak_list.add(g_leak);
        setState(() {
          psta = "Abnormal";
        });
        FloatingSnackBar(
            backgroundColor: Colors.blue,
            message: "Abnormal Pressure : $ppress Psi",
            context: context);
        DateTime now = new DateTime.now();
        ptime.add(now);
        pcs1.add(psta);
        ppressure.add(ppress);
        ppress_con.add(ppress.toDouble());
        int hour = now.hour;
        int min = now.minute;
        con_tem val = con_tem("$hour : $min", ppress.toDouble());
        ptime_con_press.add(val);
      } else {
        pl_status_list.add(l_status);
        pg_leak_list.add(g_leak);
        setState(() {
          psta = "Normal";
        });
        DateTime now = new DateTime.now();
        ptime.add(now);
        pcs1.add(psta);
        ppressure.add(ppress);
        ppress_con.add(ppress.toDouble());
        int hour = now.hour;
        int min = now.minute;
        con_tem val = con_tem("$hour : $min", ppress.toDouble());
        ptime_con_press.add(val);
      }
      //temperature condition
      if (ptem < 15) {
        setState(() {
          psta = "Abnormal";
        });
        FloatingSnackBar(
            backgroundColor: Colors.blue,
            message: "Abnormal temperature : $ptem°C",
            context: context);
        DateTime now = new DateTime.now();
        pttime.add(now);
        pcs2.add(psta);
        ptemperature.add(ptem);
        ppress_con.add(ppress.toDouble());
        int hour = now.hour;
        int min = now.minute;
        con_tem val = con_tem("$hour : $min", ptem.toDouble());
        ptime_con_tem.add(val);
      } else if (20 < ptem) {
        setState(() {
          psta = "Abnormal";
        });
        FloatingSnackBar(
            backgroundColor: Colors.blue,
            message: "Abnormal temperature : $ptem°C ",
            context: context);

        DateTime now = new DateTime.now();
        pttime.add(now);
        pcs2.add(psta);
        ptemperature.add(ptem);

        ptemp_con.add(ptem.toDouble());
        ppress_con.add(ppress.toDouble());
        int hour = now.hour;
        int min = now.minute;
        con_tem val = con_tem("$hour : $min", ptem.toDouble());
        ptime_con_tem.add(val);
      } else {
        setState(() {
          psta = "Normal";
        });
        DateTime now = new DateTime.now();
        pttime.add(now);
        pcs2.add(psta);
        ptemperature.add(ptem);
        ptemp_con.add(ptem.toDouble());
        ppress_con.add(ppress.toDouble());
        int hour = now.hour;
        int min = now.minute;
        con_tem val = con_tem("$hour : $min", ptem.toDouble());
        ptime_con_tem.add(val);
      }
    }
  }

  Future? ran_bool() async {
    while (true) {
      await Future.delayed(Duration(seconds: 60));

      setState(() {
        l_status = Random().nextBool();

        g_leak = Random().nextBool();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    ran();
    ran_bool();
  }

  Widget build(BuildContext context) {
    Size Screen = MediaQuery.of(context).size;
    // var s_size = Screen.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("MZ SCADA", style: TextStyle(color: Colors.black)),
        //SCADA TOOL FOR INTELLIGENT MANHOLE MONITORING SYSTEM USING DATA MINING
        // centerTitle: true,

        actions: [
          SizedBox(
              width: Screen.width * 0.2,
              child: Center(child: Text("Dashboard"))),
          IconButton(
              onPressed: () {
                // temper();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ptem_page()));
              },
              icon: Icon(Icons.device_thermostat_outlined)),
          // IconButton(
          //     onPressed: () {
          //       // pressu();
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => press_page()));
          //     },
          //     icon: Icon(Icons.equalizer))
        ],
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
            // Text("$s_size", style: TextStyle(fontSize: 20)),
            SizedBox(
              width: Screen.width * 0.9,
              child: Center(
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                        "INTELLIGENT MANHOLE MONITORING SYSTEM",
                        speed: Duration(milliseconds: 70),
                        textStyle: const TextStyle(
                            fontSize: 30,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold))
                  ],
                  // isRepeatingAnimation: true,
                ),
              ),
            ),
            SizedBox(
              height: Screen.height * 0.05,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Screen.width * 0.85,
                    // height: Screen.height * 0.4,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.blue,
                      elevation: 10,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: Screen.height * 0.1,
                              width: Screen.width * 0.8,
                              child: Center(
                                child: Text(
                                  "Temperature",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Screen.width * 0.08),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: Screen.height * 0.2,
                                  width: Screen.width * 0.3,
                                  child: Card(
                                      color: Colors.lightBlue,
                                      child: Center(
                                        child: Text(
                                          '${ptem.roundToDouble()} °C',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Screen.width * 0.08),
                                        ),
                                      )),
                                ),
                                SizedBox(
                                    height: Screen.height * 0.3,
                                    width: Screen.width * 0.3,
                                    child: Center(
                                        child: Container(
                                            child: SfRadialGauge(
                                                axes: <RadialAxis>[
                                          RadialAxis(
                                              minimum: 0,
                                              maximum: 150,
                                              ranges: <GaugeRange>[
                                                GaugeRange(
                                                    startValue: 0,
                                                    endValue: 50,
                                                    color: Colors.green),
                                                GaugeRange(
                                                    startValue: 50,
                                                    endValue: 100,
                                                    color: Colors.orange),
                                                GaugeRange(
                                                    startValue: 100,
                                                    endValue: 150,
                                                    color: Colors.red)
                                              ],
                                              pointers: <GaugePointer>[
                                                NeedlePointer(
                                                    enableAnimation: true,
                                                    enableDragging: true,
                                                    value: ptem.roundToDouble())
                                              ],
                                              annotations: <GaugeAnnotation>[
                                                GaugeAnnotation(
                                                    widget: Container(
                                                        child: Text(
                                                            '${ptem.roundToDouble()} °C',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold))),
                                                    angle: 90,
                                                    positionFactor: 0.5)
                                              ])
                                        ])))),
                              ],
                            )
                          ]),
                    )),
                SizedBox(
                    width: Screen.width * 0.85,
                    // height: Screen.height * 0.4,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.blue,
                      elevation: 10,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: Screen.height * 0.1,
                              width: Screen.width * 0.8,
                              child: Center(
                                child: Text(
                                  "Pressure",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Screen.width * 0.08),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  height: Screen.height * 0.2,
                                  width: Screen.width * 0.3,
                                  child: Card(
                                      color: Colors.lightBlue,
                                      child: Center(
                                        child: Text(
                                          '${ppress.roundToDouble()} Psi',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: Screen.width * 0.08),
                                        ),
                                      )),
                                ),
                                SizedBox(
                                    height: Screen.height * 0.3,
                                    width: Screen.width * 0.3,
                                    child: Center(
                                        child: Container(
                                            child: SfRadialGauge(
                                                axes: <RadialAxis>[
                                          RadialAxis(
                                              minimum: 2000,
                                              maximum: 4000,
                                              ranges: <GaugeRange>[
                                                GaugeRange(
                                                    startValue: 2000,
                                                    endValue: 3150,
                                                    color: Colors.green),
                                                GaugeRange(
                                                    startValue: 3150,
                                                    endValue: 3250,
                                                    color: Colors.orange),
                                                GaugeRange(
                                                    startValue: 3250,
                                                    endValue: 4000,
                                                    color: Colors.red)
                                              ],
                                              pointers: <GaugePointer>[
                                                NeedlePointer(
                                                    enableAnimation: true,
                                                    enableDragging: true,
                                                    value:
                                                        ppress.roundToDouble())
                                              ],
                                              annotations: <GaugeAnnotation>[
                                                GaugeAnnotation(
                                                    widget: Container(
                                                        child: Text(
                                                            '${ppress.roundToDouble()} Psi',
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold))),
                                                    angle: 90,
                                                    positionFactor: 0.5)
                                              ])
                                        ])))),
                              ],
                            ),
                          ]),
                    )),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            // chart
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Screen.width * 0.8,
                    // height: Screen.height * 0.4,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.blue,
                      elevation: 10,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: Screen.height * 0.1,
                              width: Screen.width * 0.5,
                              child: Center(
                                child: Text(
                                  "Temperature",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Screen.width * 0.05),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                                child: SfCartesianChart(
                                    primaryXAxis: CategoryAxis(),
                                    series: <LineSeries<con_tem, String>>[
                                  LineSeries<con_tem, String>(
                                      dataSource: ptime_con_tem,
                                      xValueMapper: (con_tem sales, _) =>
                                          sales.time_level,
                                      yValueMapper: (con_tem sales, _) =>
                                          sales.tem_level)
                                ])),
                          ]),
                    )),
                SizedBox(
                    width: Screen.width * 0.8,
                    // height: Screen.height * 0.4,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.blue,
                      elevation: 10,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: Screen.height * 0.1,
                              width: Screen.width * 0.5,
                              child: Center(
                                child: Text(
                                  "Pressure",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Screen.width * 0.05),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                                child: SfCartesianChart(
                                    primaryXAxis: CategoryAxis(),
                                    series: <LineSeries<con_tem, String>>[
                                  LineSeries<con_tem, String>(
                                      dataSource: ptime_con_press,
                                      xValueMapper: (con_tem sales, _) =>
                                          sales.time_level,
                                      yValueMapper: (con_tem sales, _) =>
                                          sales.tem_level)
                                ])),
                          ]),
                    )),
              ],
            ),
            // chart End
            SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: Screen.width * 0.8,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        shadowColor: Colors.blue,
                        elevation: 10,
                        child: Column(
                          children: [
                            SizedBox(
                              child: Text("Lid Status :",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Screen.width * 0.08)),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                                child: Text(
                              "${l_status ? "Close" : "Open"}",
                              style: TextStyle(
                                  fontSize: Screen.width * 0.07,
                                  fontWeight: FontWeight.bold,
                                  color: l_status ? Colors.green : Colors.red),
                            )),
                            SizedBox(height: 20)
                          ],
                        ))),
                SizedBox(
                    width: Screen.width * 0.8,
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        shadowColor: Colors.blue,
                        elevation: 10,
                        child: Column(
                          children: [
                            SizedBox(
                              child: Text(
                                "Gas Leakage :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: Screen.width * 0.08),
                              ),
                            ),
                            SizedBox(height: 20),
                            SizedBox(
                                child: Text(
                              "${g_leak ? "Yes" : "No"}",
                              style: TextStyle(
                                  fontSize: Screen.width * 0.07,
                                  fontWeight: FontWeight.bold,
                                  color: g_leak ? Colors.red : Colors.green),
                            )),
                            SizedBox(height: 20)
                          ],
                        ))),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: Screen.height * 0.1,
              width: Screen.width * 0.6,
              child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(StadiumBorder())),
                  onPressed: () {
                    status();
                  },
                  child: Center(
                      child: Text(
                    "Check Current Status",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ))),
            ),
            SizedBox(
              height: 150,
            )
          ],
        ),
      )),
    );
  }

  temper() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
                child: ListView.builder(
                    itemCount: pttime.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                          child: ListTile(title: ptemperature[index]));
                    })),
            actions: [
              SizedBox(
                child: TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
            title: Text("Temperature Records",
                style: TextStyle(fontWeight: FontWeight.bold)),
          );
        });
  }

  pressu() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: SingleChildScrollView(
                child: ListView.builder(
                    itemCount: ptime.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(child: ListTile(title: ppressure[index]));
                    })),
            actions: [
              SizedBox(
                child: TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
            title: Text("Pressure Records",
                style: TextStyle(fontWeight: FontWeight.bold)),
          );
        });
  }

  void status() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: Text(
                "Current Status",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            content: SizedBox(
              height: 200,
              width: 300,
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 2),
                      SizedBox(
                          child: Row(
                        children: [
                          SizedBox(
                            child: Text("Temperature",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Text(" $ptem°C     ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  child: Text("$psta",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                      SizedBox(height: 20),
                      SizedBox(
                          child: Row(
                        children: [
                          SizedBox(
                            child: Text("Pressure        ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Text(" $ppress Psi ",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                                SizedBox(
                                  child: Text("$psta",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ),
                        ],
                      )),
                    ]),
              ),
            ),
            actions: [
              SizedBox(
                child: TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          );
        });
  }
}

class con_tem {
  con_tem(this.time_level, this.tem_level);
  final String time_level;
  final double tem_level;
}
