import 'package:chat_app/common/widgets/k_loading_indicator.dart';
import 'package:flutter/material.dart';

Widget kTickButton(
    {void Function()? onTap,
    required bool isLoding,
    required BuildContext context}) {
  return InkWell(
    borderRadius: BorderRadius.circular(80),
    onTap: onTap,
    child: CircleAvatar(
      backgroundColor: Colors.transparent,
      child: isLoding == true
          ? SizedBox(
              height: 20,
              width: 20,
              child: kLoadingIndicator(
                context: context,
                background: Colors.white,
                strockWidth: 3,
              ),
            )
          : const Icon(
              Icons.check,
              color: Colors.white,
              size: 30,
            ),
    ),
  );
}
