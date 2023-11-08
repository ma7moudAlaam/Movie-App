import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenreItem extends StatelessWidget {
  const GenreItem({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 25,
      width: 65,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFF514F4F)),
      ),
      child: Text(
        name,
        style: GoogleFonts.inter(
            fontSize: 10,
            color: const Color(0xFFCBCBCB),
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
