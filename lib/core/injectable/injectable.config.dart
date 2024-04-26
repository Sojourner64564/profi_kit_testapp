// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/my_feature_name/data/data_source/items_data_source_remote.dart'
    as _i3;
import '../../features/my_feature_name/data/repository/fetch_items_repository_impl.dart'
    as _i5;
import '../../features/my_feature_name/domain/repository/fetch_items_repository.dart'
    as _i4;
import '../../features/my_feature_name/domain/usecase/fetch_items_use_case.dart'
    as _i6;
import '../../features/my_feature_name/presentation/cubit/fetch_items_cubit/fetch_items_cubit.dart'
    as _i7;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.ItemsClientDataSourceRemote>(
      () => _i3.ItemsClientDataSourceRemote());
  gh.lazySingleton<_i4.FetchItemsRepository>(() =>
      _i5.FetchItemsRepositoryImpl(gh<_i3.ItemsClientDataSourceRemote>()));
  gh.factory<_i6.FetchItemsUseCase>(
      () => _i6.FetchItemsUseCase(gh<_i4.FetchItemsRepository>()));
  gh.lazySingleton<_i7.FetchItemsCubit>(
      () => _i7.FetchItemsCubit(gh<_i6.FetchItemsUseCase>()));
  return getIt;
}
