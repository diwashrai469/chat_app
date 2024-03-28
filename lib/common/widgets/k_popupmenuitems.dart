import 'package:flutter/material.dart';

Widget kPopupMenuItems(
    {Function(String)? onSelected,
    required List<PopupMenuEntry<String>> Function(BuildContext) itemBuilder,
    required Widget child}) {
  return PopupMenuButton<String>(
    color: Colors.white,
    offset: const Offset(0, 40),
    padding: const EdgeInsets.all(20),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8.0),
      ),
    ),
    onSelected: onSelected,
    itemBuilder: itemBuilder,
    child: child,
  );
}
