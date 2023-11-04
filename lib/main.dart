import 'package:flutter/material.dart';
import 'package:movie/core/theme/application_theme.dart';
import 'package:movie/layout/home_layout/home_layout.dart';
import 'package:movie/pages/splash/splash_view.dart';

void main() {
  runApp(const MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationTheme.dark,
      initialRoute: SplashView.routName,
      routes: {
        SplashView.routName:(context) =>const  SplashView(),
        HomeLayout.routName:(context)=>HomeLayout()
      },

    );
  }
}
