import 'package:chat_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'k_loading_indicator.dart';

class KLoader {
  static Future<dynamic> showMyLoader(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (contex) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: kLoadingIndicator(
                    context: context, background: primaryColor),
              ),
            ),
          ),
        );
      },
    );
  }
}
