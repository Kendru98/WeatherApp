import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final city16g = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: MyColors.whiteBackground,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );

  static final city12g = GoogleFonts.poppins(
    textStyle: const TextStyle(
      height: 1,
      color: MyColors.textHint,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );

  static final city16 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: MyColors.popText,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.24,
    ),
  );

  static final city12 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: MyColors.textGreyCityItem,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.24,
    ),
  );
  static final main16w600 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: MyColors.whiteBackground,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    ),
  );
  static final main16w400 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: MyColors.whiteBackground,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );
  static final popmenutext = GoogleFonts.roboto(
    textStyle: const TextStyle(
      color: MyColors.popText,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
  );
  static final main72w700 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: MyColors.whiteBackground,
      fontSize: 72,
      fontWeight: FontWeight.w700,
    ),
  );
  static final main12w400 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: MyColors.whiteBackground,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );
  static final main16w500 = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: MyColors.whiteBackground,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );
  static final main16w500b = GoogleFonts.poppins(
    textStyle: const TextStyle(
      color: MyColors.mainDark,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
  );
}
