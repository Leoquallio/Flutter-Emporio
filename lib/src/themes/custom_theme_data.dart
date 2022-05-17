import 'package:flutter/material.dart';
import 'package:flutter_emporio/src/themes/colors_app.dart';

abstract class CustomThemeData {
  static ThemeData themeData = ThemeData(
      primaryColor: ColorsApp.kPrimaryColor,
      colorScheme:
          ThemeData().colorScheme.copyWith(primary: ColorsApp.kPrimaryColor),
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      focusColor: ColorsApp.kPrimaryColor);
}
