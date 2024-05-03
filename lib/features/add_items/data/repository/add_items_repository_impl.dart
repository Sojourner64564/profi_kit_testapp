import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_kit_testapp/core/failure/failure.dart';
import 'package:profi_kit_testapp/features/add_items/data/data_source/add_items_data_source_remote.dart';
import 'package:profi_kit_testapp/features/add_items/data/models/extension/extension_item_model_to_entety.dart';
import 'package:profi_kit_testapp/features/add_items/domain/entity/item_entity.dart';
import 'package:profi_kit_testapp/features/add_items/domain/repository/add_items_repository.dart';

@LazySingleton(as: AddItemsRepository)
class AddItemsRepositoryImpl implements AddItemsRepository{
  final  AddItemsClientDataSourceRemote addItemsClientDataSourceRemote;

  AddItemsRepositoryImpl(this.addItemsClientDataSourceRemote);

  @override
  Future<Either<Failure, ItemEntity>> addItems(String login, String password, String name, String description, String measurementUnits, String code) async{
    try{
      final accessTokenModel = await addItemsClientDataSourceRemote.client().fetchAccessToken(jsonEncode({
        'login':login,
        'password':password,
      }));
      final accessToken = accessTokenModel.accessToken;
      final responseModel = await addItemsClientDataSourceRemote.client().fetchAddItemModel(
        accessToken,
        jsonEncode({
          'name':name,
          'description':description,
          'measurement_units':measurementUnits,
          'code':code,
        }),
      );
      final responseEntity = responseModel.toEntity();
      return Right(responseEntity);
    }catch(e){
      return Left(ServerFailure());
    }

  }

}