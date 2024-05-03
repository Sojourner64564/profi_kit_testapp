import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_kit_testapp/features/add_items/data/models/access_token_model.dart';
import 'package:profi_kit_testapp/features/add_items/data/models/item_model.dart';
import 'package:retrofit/http.dart';

part 'add_items_data_source_remote.g.dart';

@RestApi(baseUrl: 'https://hcateringback-dev.unitbeandev.com/api')
abstract class AddItemsDataSourceRemote{
  factory AddItemsDataSourceRemote(Dio dio) = _AddItemsDataSourceRemote;

  @POST('/auth/login')
  Future<AccessTokenModel> fetchAccessToken(
      @Body() String body
      );

  @POST('/wh/items')
  Future<ItemModel> fetchAddItemModel(
      @Header('Authorization') String authorization,
      @Body() String body,
      );
  //https://hcateringback-dev.unitbeandev.com/api/wh/items
}


@lazySingleton
class AddItemsClientDataSourceRemote{
  AddItemsDataSourceRemote client(){
    return _AddItemsDataSourceRemote(Dio());
  }
}