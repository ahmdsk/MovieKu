import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Themes {
  static const primaryColor = Color(0xFF1F1D2B);
  static const softColor = Color(0xFF252836);
  static const whiteColor = Color(0xFFFFFFFF);
  static const grayColor = Color(0xFF92929D);

  static TextStyle baseTextStyle = GoogleFonts.poppins().copyWith(
    overflow: TextOverflow.ellipsis,
    fontWeight: FontWeight.w100,
    color: whiteColor,
  );

  static TextStyle headingStyle = baseTextStyle.merge(
    GoogleFonts.plusJakartaSans().copyWith(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextStyle titleStyle = baseTextStyle.merge(
    GoogleFonts.plusJakartaSans().copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
    ),
  );

  static TextStyle bodyStyle = baseTextStyle.merge(
    GoogleFonts.plusJakartaSans().copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );
}
