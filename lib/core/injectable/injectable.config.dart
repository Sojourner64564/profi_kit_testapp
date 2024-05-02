// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/stock_items/data/data_source/items_data_source_remote.dart'
    as _i3;
import '../../features/stock_items/data/repository/fetch_items_repository_impl.dart'
    as _i6;
import '../../features/stock_items/domain/repository/fetch_items_repository.dart'
    as _i5;
import '../../features/stock_items/domain/usecase/fetch_items_use_case.dart'
    as _i7;
import '../../features/stock_items/presentation/cubit/fetch_items_cubit/fetch_items_cubit.dart'
    as _i8;
import '../../features/stock_items/presentation/cubit/update_pager_cubit/update_pager_cubit.dart'
    as _i4;

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
  gh.lazySingleton<_i4.UpdatePagerCubit>(() => _i4.UpdatePagerCubit());
  gh.lazySingleton<_i5.FetchItemsRepository>(() =>
      _i6.FetchItemsRepositoryImpl(gh<_i3.ItemsClientDataSourceRemote>()));
  gh.factory<_i7.FetchItemsUseCase>(
      () => _i7.FetchItemsUseCase(gh<_i5.FetchItemsRepository>()));
  gh.lazySingleton<_i8.FetchItemsCubit>(
      () => _i8.FetchItemsCubit(gh<_i7.FetchItemsUseCase>()));
  return getIt;
}
