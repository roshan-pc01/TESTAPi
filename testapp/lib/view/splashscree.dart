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
      Duration(seconds: 5),
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
      backgroundColor: Colors.yellow,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('welcome...'),
            ),
            Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
