import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weatherapp_starter_project/presentation/utils/custom_colors.dart';

ThemeData appTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    fontFamily: GoogleFonts.montserrat().fontFamily,
    scaffoldBackgroundColor: CustomColor.kWhiteColor,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: CustomColor.kBlackColor,
      ),
      bodySmall: TextStyle(
        color: CustomColor.kBlackColor,
      ),
      bodyMedium: TextStyle(
        color: CustomColor.kBlackColor,
      ),
    ),
  );
}

TextStyle customTextStyle({
  required Color color,
  required double size,
  required FontWeight fontWeight,
}) {
  return TextStyle(
    color: color,
    fontSize: size,
    fontWeight: fontWeight,
  );
}
