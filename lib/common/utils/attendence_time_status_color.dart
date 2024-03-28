//status color
import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

Color attendeceTimeStatusColor(String status) {
  if (status == "Late") {
    return lateColor;
  }

  if (status == "Left Early") {
    return lateColor;
  }
  if (status == "Half Day") {
    return halfDayColor;
  }
  return Colors.green;
}
