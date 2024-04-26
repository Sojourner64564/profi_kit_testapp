import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_kit_testapp/core/injectable/injectable.dart';
import 'package:profi_kit_testapp/features/my_feature_name/domain/entity/items_entity.dart';
import 'package:profi_kit_testapp/features/my_feature_name/domain/usecase/fetch_items_use_case.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/cubit/update_pager_cubit/update_pager_cubit.dart';

part 'fetch_items_state.dart';

@lazySingleton
class FetchItemsCubit extends Cubit<FetchItemsState> {
  FetchItemsCubit(this.fetchItemsUseCase) : super(FetchItemsStateInitial());
  final FetchItemsUseCase fetchItemsUseCase;
  final updatePagerCubit = getIt<UpdatePagerCubit>();


  Future<void> fetchItems() async {
    emit(FetchItemsStateLoading());
    final eitherFailureOrItemEntity = await fetchItemsUseCase.fetchItems(
        'admin', 'admin', 1, 10);
    final itemsEntity = eitherFailureOrItemEntity.toOption().toNullable();
    if (itemsEntity == null){
      emit(FetchItemsStateError());
      return;
    }
    if(itemsEntity.results.isEmpty){
      emit(FetchItemsStateEmpty());
      return;
    }
    updatePagerCubit.updatePager(10, itemsEntity);
    emit(FetchItemsStateLoaded(itemsEntity));

  }


}
