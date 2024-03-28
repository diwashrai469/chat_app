import 'package:flutter/material.dart';

class KListtile extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final void Function()? onKeyPressed;

  const KListtile(
      {super.key,
      this.leading,
      this.title,
      this.subtitle,
      this.onKeyPressed,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 3,
      onTap: onKeyPressed,
      visualDensity: const VisualDensity(horizontal: -3, vertical: 2),
      leading: leading,
      title: title,
      subtitle: subtitle,
      trailing: trailing,
    );
  }
}
