// Flutter imports:
import 'package:flutter/material.dart';

class AppTextStyle {
  BuildContext context;
  AppTextStyle(this.context);
  static TextStyle loginAppName = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: Colors.white,
  );

  static TextStyle headlineMedium = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  static TextStyle headlineRegular = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle titleMedium = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle subheadingMedium = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle bodyMedium = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w800,
    color: Colors.white,
  );

  static TextStyle bodyRegular = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle captionRegular = const TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );

  static TextStyle minicaps = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle button = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}
