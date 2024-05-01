import 'dart:html';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_kit_testapp/core/colors/my_colors.dart';
import 'package:profi_kit_testapp/features/my_feature_name/domain/entity/items_entity.dart';

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
    final List<Color> borderColorList = List.filled(totalPages, MyColors.myTransparentColor);
    final List<Color> numberColorList = List.filled(totalPages, MyColors.myBlackColor);
    borderColorList[0] = MyColors.myAppRedColor;
    numberColorList[0] = MyColors.myAppRedColor;
    emit(UpdatePagerStateLoaded(totalPages,borderColorList,numberColorList));
  }

  void tapOnButtonPager(int index) {
    emit(UpdatePagerStateInitial());
    final totalItems = itemsEntity.total;
    final totalPages = totalItems~/pageSize;
    List<Color> listBorderColors = [];
    List<Color> listNumberColors = [];
    for(int i=0;i<totalPages;i++){
      if(i==index){
        listBorderColors.add(MyColors.myAppRedColor);
        listNumberColors.add(MyColors.myAppRedColor);
      }
      if(i!=index){
        listBorderColors.add(MyColors.myTransparentColor);
        listNumberColors.add(MyColors.myBlackColor);
      }
    }
    emit(UpdatePagerStateLoaded(totalPages,listBorderColors, listNumberColors));
  }

  void moveScrollPager(int index, ScrollController scrollController) {
    if(index<4){
      scrollController.jumpTo(0);
      return;
    }
    scrollController.jumpTo((index-3)*40);
  }
}
