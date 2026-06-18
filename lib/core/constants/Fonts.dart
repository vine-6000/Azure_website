import 'package:azure_website/core/constants/Colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Agrandir extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color fontcolor;
  final double spacing;

  const Agrandir({
    required this.text,
    this.fontsize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontcolor = AppColors.softblack,
    this.spacing = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.syne(
        color: fontcolor,
        fontSize: fontsize,
        fontWeight: fontWeight,
        letterSpacing: spacing,
      ),
    );
  }
}

class CanvaSans extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color fontcolor;
  final TextAlign textAlign;

  const CanvaSans({
    required this.text,
    this.fontsize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontcolor = AppColors.softblack,
    this.textAlign = TextAlign.start,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: textAlign,
      text,
      style: GoogleFonts.inter(
        color: fontcolor,
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
    );
  }
}

class BrightSunshine extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontWeight;
  final Color fontcolor;

  const BrightSunshine({
    required this.text,
    this.fontsize = 14,
    this.fontWeight = FontWeight.normal,
    this.fontcolor = AppColors.softblack,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.greatVibes(
        color: fontcolor,
        fontSize: fontsize,
        fontWeight: fontWeight,
      ),
    );
  }
}
