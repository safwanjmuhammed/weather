import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather/pages/popup.dart';

void main() {
  runApp(MaterialApp(
    home: Splash(),
    debugShowCheckedModeBanner: false,
  ));
}

class Splash extends StatefulWidget {
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WeatherApi4()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xEDE7F6),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill, image: AssetImage("assets/images/splashb.png")),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/splash.png",
                height: 200,
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
