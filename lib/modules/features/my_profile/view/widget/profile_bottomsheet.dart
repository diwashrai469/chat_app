import 'package:chat_app/common/constant/app_dimens.dart';
import 'package:chat_app/common/constant/ui_helpers.dart';
import 'package:chat_app/common/widgets/k_container_for_bottom_sheet.dart';
import 'package:chat_app/core/injection/injection.dart';
import 'package:chat_app/modules/features/my_profile/view_model/my_profile_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Widget profileBottomsheet({required BuildContext context}) {
  final myProfileViewModel = locator<MyProfileViewModel>();
  return Column(
    children: [
      kContainerForBottomSheet(),
      mHeightSpan,
      Text(
        "Change your profile picture",
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: AppDimens.headlineFontSizeSmall1),
      ),
      mHeightSpan,
      ListTile(
        onTap: () => myProfileViewModel.getImage(ImageSource.camera),
        leading: const Icon(CupertinoIcons.camera),
        title: const Text('Camera'),
      ),
      ListTile(
        onTap: () => myProfileViewModel.getImage(ImageSource.gallery),
        leading: const Icon(CupertinoIcons.photo),
        title: const Text('Gallery'),
      )
    ],
  );
}
