import 'package:auto_route/auto_route.dart';
import 'package:chat_app/common/constant/app_dimens.dart';
import 'package:chat_app/core/injection/injection.dart';
import 'package:chat_app/core/routes/app_routes.dart';
import 'package:chat_app/core/routes/app_routes.gr.dart';
import 'package:chat_app/core/services/local_storage.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    final localStorage = locator<LocalStorageService>();
    final appRoutes = locator<AppRoutes>();
    String? acessToken = localStorage.read("acessToken");
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (acessToken?.isNotEmpty == true) {
          appRoutes.pushAndPopUntil(
            const PrivateChatHeadsView(),
            predicate: (route) => false,
          );
        } else {
          appRoutes.pushAndPopUntil(const LoginView(),
              predicate: (route) => false);
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Loading...",
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: AppDimens.headlineFontSizeOther,
              ),
        ),
      ),
    );
  }
}
