import 'package:chat_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../constant/app_dimens.dart';
import '../utils/app_text_style.dart';

Widget kEmptyDataWidget(String text) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      // SvgPicture.asset(
      //   AppImage.emptyimageSvg,
      // ),
      Text(
        text,
        style: appTextStyle!.copyWith(
            color: disabledColor,
            fontStyle: FontStyle.italic,
            fontSize: AppDimens.headlineFontSizeXSmall),
      ),
    ],
  );
}
