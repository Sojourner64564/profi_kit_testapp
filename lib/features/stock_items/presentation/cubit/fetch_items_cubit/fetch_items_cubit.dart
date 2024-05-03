import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_kit_testapp/core/injectable/injectable.dart';
import 'package:profi_kit_testapp/features/stock_items/domain/entity/items_entity.dart';
import 'package:profi_kit_testapp/features/stock_items/domain/usecase/fetch_items_use_case.dart';
import 'package:profi_kit_testapp/features/stock_items/presentation/cubit/update_pager_cubit/update_pager_cubit.dart';

part 'fetch_items_state.dart';

@lazySingleton
class FetchItemsCubit extends Cubit<FetchItemsState> {
  FetchItemsCubit(this.fetchItemsUseCase) : super(FetchItemsStateInitial());
  final FetchItemsUseCase fetchItemsUseCase;
  final updatePagerCubit = getIt<UpdatePagerCubit>();
  int myPageSize = 50;

  Future<void> initFetchItems() async {
    emit(FetchItemsStateLoading());
    final eitherFailureOrItemEntity = await fetchItemsUseCase.fetchItems(
        'admin', 'admin', 1, 50);
    final itemsEntity = eitherFailureOrItemEntity.toOption().toNullable();
    if (itemsEntity == null){
      emit(FetchItemsStateError());
      return;
    }
    if(itemsEntity.results.isEmpty){
      emit(FetchItemsStateEmpty());
      return;
    }
    updatePagerCubit.itemsEntity = itemsEntity;
    updatePagerCubit.pageSize = 50;
    updatePagerCubit.initPager();
    emit(FetchItemsStateLoaded(itemsEntity));
  }

  Future<void> fetchItemsWithDifPageSize(String pageSizeString) async {
    final pageSize = int.parse(pageSizeString);
    myPageSize = pageSize;
    emit(FetchItemsStateLoading());
    final eitherFailureOrItemEntity = await fetchItemsUseCase.fetchItems(
        'admin', 'admin', 1, pageSize);
    final itemsEntity = eitherFailureOrItemEntity.toOption().toNullable();
    if (itemsEntity == null){
      emit(FetchItemsStateError());
      return;
    }
    if(itemsEntity.results.isEmpty){
      emit(FetchItemsStateEmpty());
      return;
    }
    updatePagerCubit.itemsEntity = itemsEntity;
    updatePagerCubit.pageSize = pageSize;
    updatePagerCubit.initPager();
    emit(FetchItemsStateLoaded(itemsEntity));
  }

  Future<void> fetchItemsWithDifPage(int pageNumber) async {
    emit(FetchItemsStateLoading());
    final eitherFailureOrItemEntity = await fetchItemsUseCase.fetchItems(
        'admin', 'admin', pageNumber, myPageSize);
    final itemsEntity = eitherFailureOrItemEntity.toOption().toNullable();
    if (itemsEntity == null){
      emit(FetchItemsStateError());
      return;
    }
    if(itemsEntity.results.isEmpty){
      emit(FetchItemsStateEmpty());
      return;
    }
    updatePagerCubit.itemsEntity = itemsEntity;
    updatePagerCubit.pageSize = myPageSize;
    emit(FetchItemsStateLoaded(itemsEntity));
  }
}
