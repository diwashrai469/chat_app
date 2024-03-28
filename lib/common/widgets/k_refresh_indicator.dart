import 'package:chat_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

Widget kRefreshIndicator({
  required Future<void> Function() onRefresh,
  required Widget child,
}) {
  return RefreshIndicator(
    triggerMode: RefreshIndicatorTriggerMode.anywhere,
    backgroundColor: primaryColor,
    color: Colors.white,
    onRefresh: onRefresh,
    child: child,
  );
}
