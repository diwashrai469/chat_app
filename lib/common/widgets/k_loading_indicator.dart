import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget kLoadingIndicator(
    {required BuildContext context, Color? background, double? strockWidth}) {
  // Check the platform
  if (Theme.of(context).platform == TargetPlatform.iOS) {
    // iOS platform
    return const CupertinoActivityIndicator();
  } else {
    // Android platform
    return CircularProgressIndicator(
      backgroundColor: background,
      strokeWidth: strockWidth ?? 4,
    );
  }
}
