// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:korolev_project/data/database/app_database.dart' as _i756;
import 'package:korolev_project/data/repositories/editors_repository.dart'
    as _i801;
import 'package:korolev_project/pages/home/bloc/editors_bloc.dart' as _i246;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i756.AppDatabase>(() => _i756.AppDatabase());
    gh.lazySingleton<_i801.EditorsRepository>(
      () => _i801.EditorsRepository(gh<_i756.AppDatabase>()),
    );
    gh.factory<_i246.EditorsBloc>(
      () => _i246.EditorsBloc(gh<_i801.EditorsRepository>()),
    );
    return this;
  }
}
