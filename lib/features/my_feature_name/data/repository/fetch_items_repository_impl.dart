import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_kit_testapp/core/failure/failure.dart';
import 'package:profi_kit_testapp/features/my_feature_name/data/data_source/items_data_source_remote.dart';
import 'package:profi_kit_testapp/features/my_feature_name/data/models/extension/extension_items_model_to_entety.dart';
import 'package:profi_kit_testapp/features/my_feature_name/domain/entity/items_entity.dart';
import 'package:profi_kit_testapp/features/my_feature_name/domain/repository/fetch_items_repository.dart';

@LazySingleton(as: FetchItemsRepository)
class FetchItemsRepositoryImpl implements FetchItemsRepository{
  final ItemsClientDataSourceRemote itemsClientDataSourceRemote;

  FetchItemsRepositoryImpl(this.itemsClientDataSourceRemote);

  @override
  Future<Either<Failure, ItemsEntity>> fetchItems(String login, String password, int page, int pageSize) async{
      try{
        final accessTokenModel = await itemsClientDataSourceRemote.client().fetchAccessToken(jsonEncode({
          'login':login,
          'password':password,
        }));
        final accessToken = accessTokenModel.accessToken;
        final items = await itemsClientDataSourceRemote.client().fetchItems(accessToken, page, pageSize);
        final itemsEntity = items.toEntity();
        return Right(itemsEntity);
      }catch(e){
        return Left(ServerFailure());
      }

  }

}