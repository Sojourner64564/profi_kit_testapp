import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_kit_testapp/features/add_items/domain/usecase/add_items_use_case.dart';

part 'post_items_state.dart';

@lazySingleton
class PostItemsCubit extends Cubit<PostItemsState> {
  PostItemsCubit(this.addItemsUseCase) : super(PostItemsInitial());
  final AddItemsUseCase addItemsUseCase;

  Future<void> postItemsToInternet() async{
    final fdf = await addItemsUseCase.addItems('admin', 'admin','name', 'description', 'measurementUnits', 'code');
    print(fdf);
  }
}
