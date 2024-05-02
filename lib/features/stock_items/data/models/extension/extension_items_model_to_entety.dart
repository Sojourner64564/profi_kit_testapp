

import 'package:profi_kit_testapp/features/stock_items/data/models/extension/extension_item_model_to_entety.dart';
import 'package:profi_kit_testapp/features/stock_items/data/models/items_model.dart';
import 'package:profi_kit_testapp/features/stock_items/domain/entity/items_entity.dart';

extension ItemsToEntityExtension on ItemsModel{
  ItemsEntity toEntity(){
    return ItemsEntity(
      results: result.map((e) => e.toEntity(e)).toList(),
      total: total,
    );
  }
}