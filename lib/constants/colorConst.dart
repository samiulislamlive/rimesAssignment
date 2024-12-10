import 'package:flutter/material.dart';

class ColorConst {
  static Color mainColor = Colors.green.shade900;
  static Color secondaryColor = Colors.green.shade100;

  static const Color noAlert = Color(0xFF567F44);
  static const Color mild = Color(0xFF7BB31A);
  static const Color moderate = Color(0xFFEEDB00);
  static const Color seavere = Color(0xFFFFA500);
  static const Color extreme = Color(0xFFB22222);

  /*
  Alert Name: No Alert   Mild      Moderate   Seavere    Extreme
Threshold: 10+ °C        8-10 °C   6-8 °C     4-6 °C      Below 4 °C
   */

  static Color getPolygonColor(double value) {
    if(value > 10) {
      return noAlert;
    }
    else if(8 < value && value < 10) {
      return mild;
    }
    else if(6 < value && value < 8) {
      return moderate;
    }
    else if(4 < value && value < 6) {
      return seavere;
    }
    else {
      return extreme;
    }
    if (value < 10) return Colors.green;
    if (value < 20) return Colors.orange;
    return Colors.red;
  }
}