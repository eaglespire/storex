import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:storex/wrapper.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 7), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return const Wrapper();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.deepPurple,
        child: Center(
          child: TextLiquidFill(
            textAlign: TextAlign.center,
            text: 'WELCOME TO STOREX',
            waveDuration: const Duration(seconds: 5),
            waveColor: Colors.deepOrange,
            boxBackgroundColor: Colors.deepPurple,
            textStyle: const TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'raleway_black'),
          ),
        ),
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
