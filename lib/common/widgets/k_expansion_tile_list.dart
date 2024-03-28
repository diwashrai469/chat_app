import 'package:flutter/material.dart';

class KexpansionTileList extends StatelessWidget {
  final Widget title;
  final List<Widget> children;
  const KexpansionTileList({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      shape: Border.all(color: Colors.transparent),
      title: title,
      children: children,
    );
  }
}
