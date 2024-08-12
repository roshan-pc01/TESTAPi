import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testapp/view/logInscreen.dart';

class Splashscree extends StatefulWidget {
  const Splashscree({super.key});

  @override
  State<Splashscree> createState() => _SplashscreeState();
}

class _SplashscreeState extends State<Splashscree> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Loginscreen()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('welcome.....'),
      ),
    );
  }
}
