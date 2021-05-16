import 'package:flutter/material.dart';

const Color lightBackgroundItemColor = Color(0xFFF1F1F1);
const Color lightBackgroundColor = Color(0xFFE5E5E5);
const Color blackColor = Color(0xFF000000);
const Color greyColor = Color(0xFF848484);

ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.grey,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.white
  ),
  cardColor: lightBackgroundItemColor,
  primaryColor: lightBackgroundColor,
  brightness: Brightness.light,
  buttonColor: Colors.black,
  scaffoldBackgroundColor: lightBackgroundColor,
  backgroundColor: lightBackgroundColor,
  accentColor: Colors.black,
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(foregroundColor: Colors.white, backgroundColor: Colors.black),
  dividerColor: Colors.black54,
  fontFamily: 'PlayfairDisplay',
  // or use string of the font in the assets 'SFUIDisplay'
  textTheme: TextTheme(
    caption: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
        height: 29.0 / 22.0,
        color: Colors.black),
    headline1: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        height: 30 / 24,
        color: Colors.black),
    headline2: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 14 / 12,
        color: Colors.black),
    headline3: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 13,
        height: 24 / 11,
        decoration: TextDecoration.underline,
        decorationThickness: 4,
        color: Colors.black),
    headline4: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 18 / 16,
        color: Colors.black87),
     headline5: TextStyle(
       fontWeight: FontWeight.w900,
       fontSize: 20,
       height: 24/20,
         color: Colors.black
     ),
    headline6: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 21/14,
        color: Colors.black
    ),
    button: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 16/14,
        color: Colors.white
    ),
    bodyText1: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 21/14,
        color: Colors.black54
    ),
  ),
);


ThemeData darkTheme = ThemeData(
  primarySwatch: Colors.grey,
  cardColor: Colors.grey[900],
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  backgroundColor: Colors.black,
  buttonColor: Colors.white,
  accentColor: Colors.white,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black
  ),
  floatingActionButtonTheme:
  FloatingActionButtonThemeData(foregroundColor: Colors.black, backgroundColor: Colors.white),
  dividerColor: Colors.white54,
  fontFamily: 'PlayfairDisplay',
  // or use string of the font in the assets 'SFUIDisplay'
  textTheme: TextTheme(
    caption: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22.0,
        height: 29.0 / 22.0,
        color: Colors.white),
    headline1: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24,
        height: 30 / 24,
        color: Colors.white),
    headline2: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 14,
        height: 14 / 12,
        color: Colors.white),
    headline3: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 13,
        height: 24 / 11,
        decoration: TextDecoration.underline,
        decorationThickness: 4,
        color: Colors.white),
    headline4: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 18 / 16,
        color: Colors.white70),
    headline5: TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 20,
        height: 24/20,
        color: Colors.white
    ),
    headline6: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w700,
        fontSize: 14,
        height: 21/14,
        color: Colors.white
    ),
    button: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 16/14,
        color: Colors.black
    ),
    bodyText1: TextStyle(
        fontFamily: 'Roboto',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 21/14,
        color: Colors.white60
    ),
  ),
);