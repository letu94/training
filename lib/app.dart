import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_trainning_cnv/screen/dashboard/dashboard_screen.dart';
import 'package:login_trainning_cnv/screen/login_screen/login_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: LoginScreen(),
      initialRoute: 'login',
      routes: {
        'dashBoard': (context) => DashBoadScreen(),
        'login': (context) => LoginScreen(),
      },
    );
  }
}
