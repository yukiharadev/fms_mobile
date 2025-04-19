import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  fontFamily: "SF-Pro-Display",
  primarySwatch: Colors.blue,
  textTheme: const TextTheme(
    headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 16),
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  scaffoldBackgroundColor: Colors.white,
);
