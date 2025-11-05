import 'dart:async';

import 'package:flutter/material.dart';

import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 5),(){
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder:
                  (context) => Introduction_Screen()
          )
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
              opacity: 0.1,
              child: Image.asset('assets/images/image.png',
                height: double.infinity,
                width: double.infinity,
                fit: BoxFit.cover,
              )
          ),
          Center(
              child: InteractiveViewer(
                  maxScale: 10.0,
                  child: Image.asset('assets/images/logo.png',
                    width: 250,
                  )
              )
          )

        ],
      ),
    );
  }
}
