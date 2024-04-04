// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:chat_app/modules/features/chat_list/view/chat_list_view.dart'
    as _i1;
import 'package:chat_app/modules/features/login/view/login_view.dart' as _i2;
import 'package:chat_app/modules/features/my_profile/view/my_profile_view.dart'
    as _i3;
import 'package:chat_app/modules/features/private_chat/view/private_chat_view.dart'
    as _i4;
import 'package:chat_app/modules/features/sign_up/view/sign_up_view.dart'
    as _i5;
import 'package:chat_app/modules/features/splash/view/splash_view.dart' as _i6;
import 'package:flutter/material.dart' as _i8;

abstract class $AppRoutes extends _i7.RootStackRouter {
  $AppRoutes({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    ChatListView.name: (routeData) {
      final args = routeData.argsAs<ChatListViewArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.ChatListView(
          key: args.key,
          uid: args.uid,
          name: args.name,
          profilePicture: args.profilePicture,
        ),
      );
    },
    LoginView.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginView(),
      );
    },
    MyProfileView.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MyProfileView(),
      );
    },
    PrivateChatView.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PrivateChatView(),
      );
    },
    SignUpView.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SignUpView(),
      );
    },
    SplashView.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.ChatListView]
class ChatListView extends _i7.PageRouteInfo<ChatListViewArgs> {
  ChatListView({
    _i8.Key? key,
    required String uid,
    required String name,
    required String profilePicture,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ChatListView.name,
          args: ChatListViewArgs(
            key: key,
            uid: uid,
            name: name,
            profilePicture: profilePicture,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatListView';

  static const _i7.PageInfo<ChatListViewArgs> page =
      _i7.PageInfo<ChatListViewArgs>(name);
}

class ChatListViewArgs {
  const ChatListViewArgs({
    this.key,
    required this.uid,
    required this.name,
    required this.profilePicture,
  });

  final _i8.Key? key;

  final String uid;

  final String name;

  final String profilePicture;

  @override
  String toString() {
    return 'ChatListViewArgs{key: $key, uid: $uid, name: $name, profilePicture: $profilePicture}';
  }
}

/// generated route for
/// [_i2.LoginView]
class LoginView extends _i7.PageRouteInfo<void> {
  const LoginView({List<_i7.PageRouteInfo>? children})
      : super(
          LoginView.name,
          initialChildren: children,
        );

  static const String name = 'LoginView';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MyProfileView]
class MyProfileView extends _i7.PageRouteInfo<void> {
  const MyProfileView({List<_i7.PageRouteInfo>? children})
      : super(
          MyProfileView.name,
          initialChildren: children,
        );

  static const String name = 'MyProfileView';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PrivateChatView]
class PrivateChatView extends _i7.PageRouteInfo<void> {
  const PrivateChatView({List<_i7.PageRouteInfo>? children})
      : super(
          PrivateChatView.name,
          initialChildren: children,
        );

  static const String name = 'PrivateChatView';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignUpView]
class SignUpView extends _i7.PageRouteInfo<void> {
  const SignUpView({List<_i7.PageRouteInfo>? children})
      : super(
          SignUpView.name,
          initialChildren: children,
        );

  static const String name = 'SignUpView';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SplashView]
class SplashView extends _i7.PageRouteInfo<void> {
  const SplashView({List<_i7.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
