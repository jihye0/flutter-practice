import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'const/colors.dart';
import 'screen/root_screen.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      scaffoldBackgroundColor: backgroundColor,
      sliderTheme: SliderThemeData(
        thumbColor: primaryColor,
        activeTrackColor: primaryColor,
        inactiveTrackColor: primaryColor.withOpacity(0.3),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: primaryColor,
        unselectedItemColor: secondaryColor,
        backgroundColor: backgroundColor,
        selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        titleTextStyle: TextStyle(
          color: primaryColor,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    home: RootScreen(),
  ));
}
