import 'package:flutter/material.dart';
import 'package:navidemo/screen1.dart';
import 'package:navidemo/screen2.dart';
import 'package:navidemo/screen3.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo',
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => Screen1(),
      //   '/second' : (context) => Screen2(),
      //   '/three' : (context) => Screen3(),
      // },
      home: Screen1(),
    );
  }
}