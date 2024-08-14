// Flutter imports:
import 'package:flutter/material.dart';

class AppColors {
  static MaterialColor primarySwatch = const Color(0xFFF97316).toMaterial();

  static const Color red = Color(0xFFEB5757);
  static const Color green = Color(0xFF13c316);

  //New design colors
  static const Color vividOrange = Color(0xFFF97316);
  static const Color royalBlue = Color(0xFF2563EB);
  static const Color neroBlack = Color(0xFF151515);
  static const Color ghostWhite = Color(0xFFFCFCDD);
  static const Color textFieldBg = Color(0xFF2C2C2E);
}

extension ColorsEx on Color {
  MaterialColor toMaterial() {
    return MaterialColor(value, _getSwatch(this));
  }

  Map<int, Color> _getSwatch(Color color) {
    final hslColor = HSLColor.fromColor(color);
    final lightness = hslColor.lightness;

    const lowDivisor = 6;
    const highDivisor = 5;

    final lowStep = (1.0 - lightness) / lowDivisor;
    final highStep = lightness / highDivisor;

    return {
      50: (hslColor.withLightness(lightness + (lowStep * 5))).toColor(),
      100: (hslColor.withLightness(lightness + (lowStep * 4))).toColor(),
      200: (hslColor.withLightness(lightness + (lowStep * 3))).toColor(),
      300: (hslColor.withLightness(lightness + (lowStep * 2))).toColor(),
      400: (hslColor.withLightness(lightness + lowStep)).toColor(),
      500: (hslColor.withLightness(lightness)).toColor(),
      600: (hslColor.withLightness(lightness - highStep)).toColor(),
      700: (hslColor.withLightness(lightness - (highStep * 2))).toColor(),
      800: (hslColor.withLightness(lightness - (highStep * 3))).toColor(),
      900: (hslColor.withLightness(lightness - (highStep * 4))).toColor(),
    };
  }
}
