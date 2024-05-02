import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_kit_testapp/features/add_items/data/models/item_model.dart';
import 'package:retrofit/http.dart';

part 'add_items_data_source_remote.g.dart';

@RestApi(baseUrl: 'https://hcateringback-dev.unitbeandev.com/api')
abstract class AddItemsDataSourceRemote{
  factory AddItemsDataSourceRemote(Dio dio) = _AddItemsDataSourceRemote;

  @POST('/auth/login')
  Future<ItemModel> fetchAddItemModel(
      @Body() String body//g
      );


}


@lazySingleton
class ItemsClientDataSourceRemote{
  AddItemsDataSourceRemote client(){
    return _AddItemsDataSourceRemote(Dio());
  }
}