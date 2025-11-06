import 'package:bloc_training/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: AppTextStyle.appBarTextDark,
      
     
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
     appBarTheme: const AppBarTheme(
      color: Colors.blue,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: AppTextStyle.appBarTextLight,
    ),
  );
}
