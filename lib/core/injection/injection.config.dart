// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:chat_app/core/routes/app_routes.dart' as _i3;
import 'package:chat_app/core/services/local_storage.dart' as _i4;
import 'package:chat_app/core/services/toast_services.dart' as _i5;
import 'package:chat_app/modules/features/sign_up/auth/auth_service.dart'
    as _i6;
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
    gh.lazySingleton<_i5.ToastService>(() => _i5.ToastService());
    gh.factory<_i6.AuthService>(() => _i6.AuthService(
          gh<_i5.ToastService>(),
          gh<_i3.AppRoutes>(),
          gh<_i4.LocalStorageService>(),
        ));
    return this;
  }
}
