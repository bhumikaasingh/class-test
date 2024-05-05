import 'package:classtest/screen/grid_view_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GridViewScreen()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Welcome bhumika",
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}