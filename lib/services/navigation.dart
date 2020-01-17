import 'package:flutter/material.dart';

navigationReset(context, screen) {
  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => screen));
  // Navigator.pushAndRemoveUntil(
  //     context, MaterialPageRoute(builder: (BuildContext context) => screen),
  //     (Route<dynamic> route) {
  //   return false;
  // });
}
