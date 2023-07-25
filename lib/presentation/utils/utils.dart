import 'package:flutter/material.dart';

TextStyle customTextStyle(
    {required Color color,
    required double size,
    required FontWeight fontWeight}) {
  return TextStyle(
    color: color,
    fontSize: size,
    fontWeight: fontWeight,
  );
}
