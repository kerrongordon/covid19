import 'package:covid19/screens/boarding/on-boarding-screen.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, toolbarHeight: 0),
      body: OnBoardingPage(),
    );
  }
}
