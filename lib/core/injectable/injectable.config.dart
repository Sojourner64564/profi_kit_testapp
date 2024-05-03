// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../features/add_items/data/data_source/add_items_data_source_remote.dart'
    as _i3;
import '../../features/add_items/data/repository/add_items_repository_impl.dart'
    as _i7;
import '../../features/add_items/domain/repository/add_items_repository.dart'
    as _i6;
import '../../features/add_items/domain/usecase/add_items_use_case.dart' as _i8;
import '../../features/add_items/presentation/cubit/post_items_cubit.dart'
    as _i11;
import '../../features/stock_items/data/data_source/items_data_source_remote.dart'
    as _i4;
import '../../features/stock_items/data/repository/fetch_items_repository_impl.dart'
    as _i10;
import '../../features/stock_items/domain/repository/fetch_items_repository.dart'
    as _i9;
import '../../features/stock_items/domain/usecase/fetch_items_use_case.dart'
    as _i12;
import '../../features/stock_items/presentation/cubit/fetch_items_cubit/fetch_items_cubit.dart'
    as _i13;
import '../../features/stock_items/presentation/cubit/update_pager_cubit/update_pager_cubit.dart'
    as _i5;

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
  gh.lazySingleton<_i3.AddItemsClientDataSourceRemote>(
      () => _i3.AddItemsClientDataSourceRemote());
  gh.lazySingleton<_i4.ItemsClientDataSourceRemote>(
      () => _i4.ItemsClientDataSourceRemote());
  gh.lazySingleton<_i5.UpdatePagerCubit>(() => _i5.UpdatePagerCubit());
  gh.lazySingleton<_i6.AddItemsRepository>(() =>
      _i7.AddItemsRepositoryImpl(gh<_i3.AddItemsClientDataSourceRemote>()));
  gh.factory<_i8.AddItemsUseCase>(
      () => _i8.AddItemsUseCase(gh<_i6.AddItemsRepository>()));
  gh.lazySingleton<_i9.FetchItemsRepository>(() =>
      _i10.FetchItemsRepositoryImpl(gh<_i4.ItemsClientDataSourceRemote>()));
  gh.lazySingleton<_i11.PostItemsCubit>(
      () => _i11.PostItemsCubit(gh<_i8.AddItemsUseCase>()));
  gh.factory<_i12.FetchItemsUseCase>(
      () => _i12.FetchItemsUseCase(gh<_i9.FetchItemsRepository>()));
  gh.lazySingleton<_i13.FetchItemsCubit>(
      () => _i13.FetchItemsCubit(gh<_i12.FetchItemsUseCase>()));
  return getIt;
}
