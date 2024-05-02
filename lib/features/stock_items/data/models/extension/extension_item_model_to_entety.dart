import 'package:profi_kit_testapp/features/stock_items/data/models/item_model.dart';
import 'package:profi_kit_testapp/features/stock_items/domain/entity/item_entity.dart';

extension ItemToEntetyExtension on ItemModel {
  ItemEntity toEntity(ItemModel newsModel) {
    return ItemEntity(
        id: id,
        name: name,
      description: description,
      measurementUnit: measurementUnit,
      code: code,
    );
  }
}
