// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chat_app/core/routes/app_routes.dart' as _i3;
import 'package:chat_app/core/services/local_storage.dart' as _i4;
import 'package:chat_app/core/services/toast_services.dart' as _i6;
import 'package:chat_app/modules/features/my_profile/view_model/my_profile_view_model.dart'
    as _i8;
import 'package:chat_app/modules/features/private_chat/view_model/cubit/private_chat_cubit.dart'
    as _i5;
import 'package:chat_app/modules/features/sign_up/view_model/auth/auth_service.dart'
    as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.AppRoutes>(() => _i3.AppRoutes());
    gh.factory<_i4.LocalStorageService>(() => _i4.LocalStorageService());
    gh.factory<_i5.PrivateChatCubit>(() => _i5.PrivateChatCubit());
    gh.lazySingleton<_i6.ToastService>(() => _i6.ToastService());
    gh.factory<_i7.AuthService>(() => _i7.AuthService(
          gh<_i6.ToastService>(),
          gh<_i3.AppRoutes>(),
          gh<_i4.LocalStorageService>(),
        ));
    gh.factory<_i8.MyProfileViewModel>(
        () => _i8.MyProfileViewModel(gh<_i6.ToastService>()));
    return this;
  }
}
