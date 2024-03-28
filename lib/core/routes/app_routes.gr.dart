// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:chat_app/modules/features/login/view/login_view.dart' as _i1;
import 'package:chat_app/modules/features/private_chat_heads/view/private_chat_heads_view.dart'
    as _i2;
import 'package:chat_app/modules/features/sign_up/view/sign_up_view.dart'
    as _i3;
import 'package:chat_app/modules/features/splash/view/splash_view.dart' as _i4;

abstract class $AppRoutes extends _i5.RootStackRouter {
  $AppRoutes({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    LoginView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LoginView(),
      );
    },
    PrivateChatHeadsView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.PrivateChatHeadsView(),
      );
    },
    SignUpView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignUpView(),
      );
    },
    SplashView.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.LoginView]
class LoginView extends _i5.PageRouteInfo<void> {
  const LoginView({List<_i5.PageRouteInfo>? children})
      : super(
          LoginView.name,
          initialChildren: children,
        );

  static const String name = 'LoginView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.PrivateChatHeadsView]
class PrivateChatHeadsView extends _i5.PageRouteInfo<void> {
  const PrivateChatHeadsView({List<_i5.PageRouteInfo>? children})
      : super(
          PrivateChatHeadsView.name,
          initialChildren: children,
        );

  static const String name = 'PrivateChatHeadsView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignUpView]
class SignUpView extends _i5.PageRouteInfo<void> {
  const SignUpView({List<_i5.PageRouteInfo>? children})
      : super(
          SignUpView.name,
          initialChildren: children,
        );

  static const String name = 'SignUpView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashView]
class SplashView extends _i5.PageRouteInfo<void> {
  const SplashView({List<_i5.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
