import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'dashboard_phone.dart';

class response extends StatefulWidget {
  const response({super.key});

  @override
  State<response> createState() => _responseState();
}

class _responseState extends State<response> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 700) {
        return mobile(context);
      }
      // else if (constraints.maxWidth < 1250) {
      //   return Desktop(context);
      // }
      else {
        return Desktop(context);
      }
    });
  }

  Widget mobile(BuildContext context) {
    return pdash();
  }

  Widget Desktop(BuildContext context) {
    return dash();
  }
}
