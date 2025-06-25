import 'package:flutter/material.dart';
import 'package:travel_package_chooser_ai/theme/colors.dart';
import 'HomeScreen.dart';
import 'InputScreen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Travel Package Chooser',
    theme: ThemeData(
      scaffoldBackgroundColor: Colors.transparent,
      primaryColor: AppColors.purple,
      colorScheme: const ColorScheme.light(
        primary: AppColors.purple,
        secondary: AppColors.softBlue,
      ),
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: AppColors.deepText),
        bodyLarge: TextStyle(fontSize: 16, color: AppColors.deepText),
      ),
    ),
    home: HomeScreen(),
  )
  );
}

