import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_kit_testapp/features/add_items/domain/usecase/add_items_use_case.dart';

part 'post_items_state.dart';

@lazySingleton
class PostItemsCubit extends Cubit<PostItemsState> {
  PostItemsCubit(this.addItemsUseCase) : super(PostItemsInitialState());
  final AddItemsUseCase addItemsUseCase;

  Future<void> postItemsToInternet(
    TextEditingController nameTextEditingController,
    TextEditingController measurementUnitsTextEditingController,
    TextEditingController codeTextEditingController,
    TextEditingController descriptionTextEditingController,
  ) async {
    if (nameTextEditingController.text.isEmpty) {
//TODO-----------
      return;
    }
    if (measurementUnitsTextEditingController.text.isEmpty) {
      //TODO-----------
      return;
    }
    final responseEitherEntityOrFailure = await addItemsUseCase.addItems(
        'admin',
        'admin',
      nameTextEditingController.text,
      descriptionTextEditingController.text,
      measurementUnitsTextEditingController.text,
      codeTextEditingController.text,
    );
  }
}
