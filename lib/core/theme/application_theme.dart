import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  Color primayColor = Color(0xFFFFBB3B);

  static ThemeData dark = ThemeData(
      textTheme: TextTheme(
          titleLarge: GoogleFonts.inter(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
          titleMedium: GoogleFonts.inter(
              fontSize: 18, color: Colors.white, fontWeight: FontWeight.w400),
          titleSmall: GoogleFonts.inter(
              fontSize: 14, color: Colors.white, fontWeight: FontWeight.w400),
          bodyLarge: GoogleFonts.inter(
              fontSize: 13,
              color: const Color(0xFFCBCBCB),
              fontWeight: FontWeight.w400),
          bodyMedium: GoogleFonts.poppins(
              fontSize: 10, color: Colors.white, fontWeight: FontWeight.w400),
          bodySmall: GoogleFonts.inter(
              fontSize: 8,
              color: const Color(0xFFB5B4B4),
              fontWeight: FontWeight.w400)),
      appBarTheme:  AppBarTheme(
          titleTextStyle:  GoogleFonts.inter(
  fontSize: 20, color: Colors.white, fontWeight: FontWeight.w400),
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xFF1D1E1D),
          centerTitle: true),
      colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFBB3B),
          background: const Color(0xFF121312),
          primary: const Color(0xFFFFBB3B)),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF1A1A1A),
          selectedItemColor: Color(0xFFFFBB3B),
          unselectedItemColor: Color(0xFFC6C6C6),
          unselectedLabelStyle: TextStyle(
              color: Color(0xFF707070),
              fontSize: 8,
              fontWeight: FontWeight.bold),
          selectedLabelStyle: TextStyle(
              color: Color(0xFFFFBB3B),
              fontSize: 8,
              fontWeight: FontWeight.bold)));
}
