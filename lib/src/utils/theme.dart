import 'package:flutter/material.dart';
import 'utils.dart';

class AppThemes {
  static ThemeData baseTheme(BuildContext context) {
    return ThemeData(
      backgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: RColors.rBlack
        ),
      ),
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: RColors.rPrimary,
          onPrimary: RColors.rPrimary,
          secondary: RColors.rSecondary,
          onSecondary: RColors.rSecondary,
          error: RColors.rError,
          onError: RColors.rError,
          background: Colors.white,
          onBackground: Colors.white,
          surface: RColors.rSurface,
          onSurface: RColors.rSurface),
      textTheme: TextTheme(
        headlineLarge: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24 * MediaQuery.textScaleFactorOf(context),
          color: Colors.black,
        ),
        headlineMedium: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 22 * MediaQuery.textScaleFactorOf(context),
            color: Colors.black
        ),
        headlineSmall: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12 * MediaQuery.textScaleFactorOf(context),
            color: RColors.rSecondary
        ),
        bodySmall: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 12 * MediaQuery.textScaleFactorOf(context),
            color: RColors.rSecondary
        ),
        titleLarge: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15 * MediaQuery.textScaleFactorOf(context)
        ),
        bodyLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14 * MediaQuery.textScaleFactorOf(context)
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
                TextStyle(
                    fontSize: 17 * MediaQuery.textScaleFactorOf(context),
                    color: Colors.white
                )),
          )
      ),
    );
  }
}