import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_kit_testapp/features/my_feature_name/data/models/access_token_model.dart';
import 'package:profi_kit_testapp/features/my_feature_name/data/models/items_model.dart';
import 'package:retrofit/http.dart';

part 'items_data_source_remote.g.dart';

@RestApi(baseUrl: 'https://hcateringback-dev.unitbeandev.com/api')
abstract class ItemsDataSourceRemote{
  factory ItemsDataSourceRemote(Dio dio) = _ItemsDataSourceRemote;

  @POST('/auth/login')
  Future<AccessTokenModel> fetchAccessToken(
      @Body() String body
      );

  ///https://hcateringback-dev.unitbeandev.com/api/wh/items?page=1&pageSize=10
  @GET('/wh/items')
  Future<ItemsModel> fetchItems(
      @Header('Authorization') String authorization,
      @Query('page') int page,
      @Query('pageSize') int pageSize,
      );
}


@lazySingleton
class ItemsClientDataSourceRemote{
  ItemsDataSourceRemote client(){
    return _ItemsDataSourceRemote(Dio());
  }
}