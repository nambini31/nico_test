import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: SoldoutColors.primaryColor,
  secondaryHeaderColor: Color(0xff000000),
  useMaterial3: true,
  fontFamily: "Poppins",
);

class SoldoutColors {
  static Color primaryColor = Color(0xff01DFFF);
  static Color secondaryColor = Color(0xffFF01A8);
  static Color white = Color(0xffffffff);
  static Color textButtonColor = Color(0xff10555F);
}
