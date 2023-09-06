import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum AppTheme { lightTheme, dartTheme }

final textTheme = TextTheme(
  displayLarge: GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 57,
    height: 64 / 57,
    letterSpacing: -0.25,
  ),
  displayMedium: GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 45,
    height: 52 / 45,
  ),
  displaySmall: GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 36,
    height: 44 / 36,
  ),
  headlineLarge: GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 32,
    height: 40 / 32,
  ),
  headlineMedium: GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 28,
    height: 36 / 28,
  ),
  headlineSmall: GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 24,
    height: 32 / 24,
  ),
  titleLarge: GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 22,
    height: 28 / 22,
  ),
  titleMedium: GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.1,
  ),
  titleSmall: GoogleFonts.roboto(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
  ),
  labelLarge: GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 20 / 14,
  ),
  labelMedium: GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 16 / 12,
  ),
  labelSmall: GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 11,
    height: 16 / 11,
  ),
  bodyLarge: GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 24 / 16,
  ),
  bodyMedium: GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
  ),
  bodySmall: GoogleFonts.roboto(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16 / 12,
  ),
);

class AppThemes {
  static final appThemeData = {
    AppTheme.dartTheme: ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      textTheme: textTheme,
      dividerColor: const Color(0xff51669e),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xff3a4d7f),
        elevation: 1,
        unselectedItemColor: Color(0xff51669e),
        selectedItemColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              const Color(0xff51669e),
            ),
            foregroundColor: MaterialStateProperty.all(Colors.white)),
      ),
      drawerTheme: const DrawerThemeData(
          backgroundColor: Color(0xff3a4d7f), surfaceTintColor: Colors.white),
      colorScheme: ColorScheme(
        background: const Color(0xff21325b), // background
        onBackground: const Color(0xff51669e),
        primary: const Color(0xff4671c6), //button
        onPrimary: Colors.white, // text on button
        brightness: Brightness.dark,
        secondary: const Color(0xff0f4e5a),
        onSecondary: Colors.white,
        error: Colors.red.shade400,
        onError: Colors.red,
        surface: const Color(0xff3a4d7f), //appbar
        onSurface: Colors.white, //text
      ),
    ),
    AppTheme.lightTheme: ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      textTheme: textTheme,
      dividerColor: const Color(0xffb5c9cd),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        elevation: 10,
        unselectedItemColor: Color(0xffb5c9cd),
        selectedItemColor: Color(0xfffdc17a),
      ),
      
      drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.white, surfaceTintColor: Colors.black),
      colorScheme: ColorScheme(
        background: const Color(0xfff8fbfb), // background
        onBackground: const Color(0xffb5c9cd),
        primary: const Color(0xfffdc17a), //button
        onPrimary: const Color(0xff16100a), // text on button
        brightness: Brightness.light,
        secondary: const Color(0xff0f4e5a),
        onSecondary: Colors.white,
        error: Colors.red.shade400,
        onError: Colors.red,
        surface: Colors.white, //appbar
        onSurface: Colors.black, //text
      ),
    )
  };
}
