import 'package:chat_app/core/injection/injection.dart';
import 'package:chat_app/core/routes/app_routes.dart';
import 'package:chat_app/core/services/local_storage.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/theme/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.init();
  setupLocator();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    OKToast(
      position: ToastPosition.bottom,
      child: MaterialApp.router(
        theme: AppThemes.light,
        debugShowCheckedModeBanner: false,
        routerConfig: locator<AppRoutes>().config(),
      ),
    ),
  );
}
