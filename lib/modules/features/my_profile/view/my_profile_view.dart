import 'package:auto_route/auto_route.dart';
import 'package:chat_app/common/constant/app_dimens.dart';
import 'package:chat_app/common/constant/ui_helpers.dart';
import 'package:chat_app/common/widgets/k_bottomsheet.dart';
import 'package:chat_app/common/widgets/k_loading_indicator.dart';
import 'package:chat_app/core/injection/injection.dart';
import 'package:chat_app/core/routes/app_routes.dart';
import 'package:chat_app/core/routes/app_routes.gr.dart';
import 'package:chat_app/core/services/local_storage.dart';
import 'package:chat_app/modules/features/my_profile/view/widget/profile_bottomsheet.dart';
import 'package:chat_app/modules/features/my_profile/view_model/my_profile_view_model.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
        actions: [
          GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                await LocalStorageService().clear(LocalStorageKeys.accessToken);
                locator<AppRoutes>().pushAndPopUntil(
                  const LoginView(),
                  predicate: (route) => false,
                );
              },
              child: const Icon(Icons.logout)),
          mWidthSpan
        ],
      ),
      body: FutureBuilder(
        future: locator<MyProfileViewModel>().getUserData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: kLoadingIndicator(context: context),
            );
          } else if (snapshot.hasData) {
            List<dynamic> userData = snapshot.data;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  mHeightSpan,
                  Stack(
                    children: [
                      userData[0]['profile_picture'] != ""
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(userData[0]['profile_picture']),
                            )
                          : const CircleAvatar(
                              radius: 50,
                              child: Icon(Icons.person),
                            ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () async {
                            kBottonsheet(
                              context: context,
                              widget: profileBottomsheet(context: context),
                            );
                          },
                          child: const CircleAvatar(
                            radius: 18,
                            backgroundColor: primaryColor,
                            child: Icon(
                              CupertinoIcons.camera,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  elHeightSpan,
                  userDetails(
                    context: context,
                    leadingText: "Fullname",
                    trailingText:
                        userData.isNotEmpty ? userData[0]['name'] ?? '' : '',
                  ),
                  sHeightSpan,
                  const Divider(),
                  sHeightSpan,
                  userDetails(
                    context: context,
                    leadingText: 'Email',
                    trailingText:
                        userData.isNotEmpty ? userData[0]['email'] ?? '' : '',
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          } else {
            return const Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}

Widget userDetails(
    {required BuildContext context,
    required String leadingText,
    required String trailingText}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        leadingText,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: AppDimens.headlineFontSizeSmall1,
            fontWeight: FontWeight.w600,
            color: disabledColor),
      ),
      Text(
        trailingText,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontSize: AppDimens.headlineFontSizeSmall1,
            fontWeight: FontWeight.w600),
      )
    ],
  );
}
