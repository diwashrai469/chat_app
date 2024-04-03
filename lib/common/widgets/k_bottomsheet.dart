import 'package:flutter/material.dart';

void kBottonsheet({
  required BuildContext context,
  bool? isScrollControlled,
  required Widget widget,
}) {
  showModalBottomSheet(
    context: context,
    constraints: const BoxConstraints(maxHeight: 250, minHeight: 250),
    isScrollControlled: isScrollControlled ?? false,
    builder: (context) => widget,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
    backgroundColor: Colors.white,
  );
}
