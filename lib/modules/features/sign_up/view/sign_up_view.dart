import 'package:auto_route/auto_route.dart';
import 'package:chat_app/common/constant/app_dimens.dart';
import 'package:chat_app/common/constant/ui_helpers.dart';
import 'package:chat_app/common/widgets/k_button.dart';
import 'package:chat_app/common/widgets/k_textformfield.dart';
import 'package:chat_app/core/injection/injection.dart';
import 'package:chat_app/modules/features/sign_up/view_model/auth/auth_service.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isloading = false;
  var authService = locator<AuthService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppDimens.mainPagePadding,
          child: Column(
            children: [
              elHeightSpan,
              Text(
                "Create your chat account",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: AppDimens.headlineFontSizeMedium,
                    fontWeight: FontWeight.bold),
              ),
              lHeightSpan,
              KTextFormField(
                controller: fullnameController,
                label: "Fullname",
                hint: 'Enter your Fullname',
              ),
              mHeightSpan,
              KTextFormField(
                controller: emailController,
                label: "Email",
                hint: 'Enter your email',
              ),
              mHeightSpan,
              KTextFormField(
                controller: passwordController,
                obscureText: true,
                label: "Password",
                hint: 'Enter your password',
              ),
              lHeightSpan,
              KButton(
                isBusy: isloading,
                size: ButtonSize.medium,
                child: const Text("Create your account"),
                onPressed: () {
                  setState(
                    () {
                      isloading = true;
                      authService
                          .signUpUser(emailController.text,
                              passwordController.text, fullnameController.text)
                          .then(
                            (value) => setState(
                              () {
                                isloading = false;
                              },
                            ),
                          );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
