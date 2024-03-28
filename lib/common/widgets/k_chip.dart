import 'package:chat_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

Widget kChip({required Widget child, Color? bgColor}) {
  return Container(
      padding: const EdgeInsets.only(top: 2, bottom: 2, left: 4, right: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: bgColor ?? primaryColor,
      ),
      child: child);
}
