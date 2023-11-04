import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movie/layout/home_layout/home_layout.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static String routName = "splash";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, HomeLayout.routName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Image.asset(
        "assets/images/splash.png",
        fit: BoxFit.cover,
        height: mediaQuery.height,
        width: mediaQuery.width,
      ),
    );
  }
}
