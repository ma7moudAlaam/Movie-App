import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  Color primayColor = Color(0xFFFFBB3B);

  static ThemeData dark = ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFBB3B),
          background: const Color(0xFF121312),
          primary: const Color(0xFFFFBB3B)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(

          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF1A1A1A),
          selectedItemColor: Color(0xFFFFBB3B),
          unselectedItemColor: Color(0xFFC6C6C6),
          unselectedLabelStyle:TextStyle(color: Color(0xFF707070), fontSize: 8,fontWeight: FontWeight.bold) ,
          selectedLabelStyle:
              TextStyle(color: Color(0xFFFFBB3B), fontSize: 8,fontWeight: FontWeight.bold)));
}
