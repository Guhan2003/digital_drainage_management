import 'package:flutter/material.dart';
// import 'dashboard.dart';
import 'dashboard_phone.dart';

class ptem_page extends StatefulWidget {
  const ptem_page({super.key});

  @override
  State<ptem_page> createState() => _ptem_pageState();
}

class _ptem_pageState extends State<ptem_page> {
  @override
  Widget build(BuildContext context) {
    Size s_screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Records"),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: ptime.length,
                itemBuilder: (context, i) {
                  return SizedBox(
                    height: s_screen.height * 0.5,
                    width: s_screen.width * 0.8,
                    child: Card(
                      color: Colors.green[500],
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: s_screen.width * 0.36,
                                height: s_screen.height * 0.09,
                                child: Text("P.ID : ${i + 1} ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: s_screen.width * 0.36,
                                height: s_screen.height * 0.09,
                                child: Center(
                                  child: Text(
                                      "Temperature : ${ptemperature[i]}°C",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: s_screen.width * 0.36,
                                height: s_screen.height * 0.09,
                                child: Center(
                                  child: Text("Pressure : ${ppressure[i]} Psi ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                width: s_screen.width * 0.36,
                                height: s_screen.height * 0.09,
                                child: Center(
                                  child: Text(
                                      "Lid Status : ${pl_status_list[i] ? "Close" : "Open"} ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: s_screen.width * 0.36,
                                height: s_screen.height * 0.18,
                                child: Center(
                                  child: Text(
                                      "Gas Leakage : ${pg_leak_list[i] ? "Yes" : "No"} ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                  width: s_screen.width * 0.36,
                                  height: s_screen.height * 0.18,
                                  child: Center(
                                    child: Text(
                                        // textAlign: TextAlign.center,
                                        "Date and Time:\n ${ptime[i]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ))
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: s_screen.width * 0.36,
                                height: s_screen.height * 0.09,
                                child: Center(
                                  child: Text("Temperature : ${pcs2[i]} ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                  width: s_screen.width * 0.36,
                                  height: s_screen.height * 0.09,
                                  child: Text(
                                      // textAlign: TextAlign.center,
                                      "Pressure : ${pcs1[i]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)))
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                })));
  }
}
// Center(
//           child: ListView.builder(
//               itemCount: ttime.length,
//               itemBuilder: (context, i) {
//                 return ListTile(
//                   title: Text("${temperature[i]}°C"),
//                   subtitle: Text("${cs2[i]}"),
//                   trailing: Text("${ttime[i]}"),
//                 );
//               })),