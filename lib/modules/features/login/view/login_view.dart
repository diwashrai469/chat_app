import 'package:auto_route/auto_route.dart';
import 'package:chat_app/common/constant/app_dimens.dart';
import 'package:chat_app/common/constant/ui_helpers.dart';
import 'package:chat_app/common/widgets/k_button.dart';
import 'package:chat_app/common/widgets/k_textformfield.dart';
import 'package:chat_app/core/injection/injection.dart';
import 'package:chat_app/core/routes/app_routes.dart';
import 'package:chat_app/core/routes/app_routes.gr.dart';
import 'package:chat_app/modules/features/sign_up/view_model/auth/auth_service.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isloading = false;
  var authService = locator<AuthService>();
  var routes = locator<AppRoutes>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppDimens.mainPagePadding,
          child: Column(
            children: [
              elHeightSpan,
              elHeightSpan,
              Text(
                "Login to your account",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: AppDimens.headlineFontSizeMedium,
                    fontWeight: FontWeight.bold),
              ),
              lHeightSpan,
              KTextFormField(
                controller: emailController,
                label: "Email",
                hint: 'Enter your email',
              ),
              mHeightSpan,
              KTextFormField(
                obscureText: true,
                controller: passwordController,
                label: "Password",
                hint: 'Enter your password',
              ),
              mHeightSpan,
              lHeightSpan,
              KButton(
                isBusy: isloading,
                size: ButtonSize.medium,
                child: const Text("Log in"),
                onPressed: () {
                  setState(
                    () {
                      isloading = true;
                      authService
                          .login(
                              email: emailController.text,
                              password: passwordController.text)
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
              ),
              lHeightSpan,
              const Row(
                children: <Widget>[
                  Expanded(child: Divider()),
                  Text("OR"),
                  Expanded(child: Divider()),
                ],
              ),
              lHeightSpan,
              ElevatedButton(
                onPressed: () {
                  routes.push(const SignUpView());
                },
                child: const Text("Create a new account."),
              ),
              ElevatedButton(
                  onPressed: () {
                    authService.signInWithGoogle();
                  },
                  child: const Text("Signup with google"))
            ],
          ),
        ),
      ),
    );
  }
}
