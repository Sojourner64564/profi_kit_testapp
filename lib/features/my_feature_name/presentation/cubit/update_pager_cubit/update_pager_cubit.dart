import 'dart:html';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_kit_testapp/core/injectable/injectable.dart';
import 'package:profi_kit_testapp/features/my_feature_name/domain/entity/items_entity.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/cubit/fetch_items_cubit/fetch_items_cubit.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/cubit/update_pager_cubit/model/pager_model.dart';

part 'update_pager_state.dart';

@lazySingleton
class UpdatePagerCubit extends Cubit<UpdatePagerState> {
  UpdatePagerCubit() : super(UpdatePagerStateInitial());
 int pageSize = 0;
 ItemsEntity itemsEntity = const ItemsEntity();

  void initPager() {
    emit(UpdatePagerStateInitial());
    final totalItems = itemsEntity.total;
    final totalPages = totalItems~/pageSize;
    final List<Color> borderColorList = List.filled(totalPages, Colors.grey);
    borderColorList[0] = Colors.red;
    emit(UpdatePagerStateLoaded(totalPages,borderColorList));
  }

  void tapOnButtonPager(int index) {
    emit(UpdatePagerStateInitial());
    final totalItems = itemsEntity.total;
    final totalPages = totalItems~/pageSize;
    List<Color> listColors = [];
    for(int i=0;i<totalPages;i++){
      if(i==index){
        listColors.add(Colors.red);
      }
      if(i!=index){
        listColors.add(Colors.grey);
      }
    }
    emit(UpdatePagerStateLoaded(totalPages,listColors));
  }

  void moveScrollPager(int index, ScrollController scrollController) {
    if(index<4){
      scrollController.jumpTo(0);
      return;
    }
    scrollController.jumpTo((index-3)*40);
  }
}
