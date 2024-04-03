import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import "app_routes.gr.dart";

@singleton
@AutoRouterConfig()
class AppRoutes extends $AppRoutes {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignUpView.page,
        ),
        AutoRoute(
          page: LoginView.page,
        ),
        AutoRoute(page: SplashView.page, initial: true),
        AutoRoute(
          page: PrivateChatView.page,
        ),
        AutoRoute(
          page: ChatListView.page,
        ),
        AutoRoute(page: MyProfileView.page)
      ];
}
