import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ColorConversion {
  Color colorFromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    if (hexCode.length == 6 || hexCode.length == 8) {
      try {
        return Color(int.parse('FF$hexCode', radix: 16));
      } catch (e) {
        if (kDebugMode) {
          print('Error parsing hex color: $hexColor');
        }
      }
    } else {
      if (kDebugMode) {
        print('Invalid hex color length: $hexColor');
      }
    }
    return Colors.transparent; // Return a fallback color, such as transparent
  }
}
