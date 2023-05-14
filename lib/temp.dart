import 'package:flutter/material.dart';
import 'dashboard.dart';

class tem_page extends StatefulWidget {
  const tem_page({super.key});

  @override
  State<tem_page> createState() => _tem_pageState();
}

class _tem_pageState extends State<tem_page> {
  @override
  Widget build(BuildContext context) {
    Size s_screen = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Records"),
        ),
        body: Center(
            child: ListView.builder(
                itemCount: time.length,
                itemBuilder: (context, i) {
                  return SizedBox(
                    height: s_screen.height * 0.45,
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
                                child: Center(
                                  child: Text("P.ID : ${i + 1} ",
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
                                      "Temperature : ${temperature[i]}°C",
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
                                  child: Text(" Pressure : ${pressure[i]} Psi ",
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
                                      "Lid Status : ${l_status_list[i] ? "Close" : "Open"} ",
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
                                  child: Text(
                                      "Gas Leakage : ${g_leak_list[i] ? "Yes" : "No"} ",
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
                                        textAlign: TextAlign.center,
                                        "Date and Time : ${time[i]}",
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
                                  child: Text("Temperature : ${cs2[i]} ",
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
                                        textAlign: TextAlign.center,
                                        "Pressure : ${cs1[i]}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20)),
                                  ))
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