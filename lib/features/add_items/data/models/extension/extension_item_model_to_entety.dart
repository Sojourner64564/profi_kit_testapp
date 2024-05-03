import 'package:profi_kit_testapp/features/add_items/data/models/item_model.dart';
import 'package:profi_kit_testapp/features/add_items/domain/entity/item_entity.dart';

extension ItemToEntetyExtension on ItemModel {
  ItemEntity toEntity() {
    return ItemEntity(
        id: id,
        name: name,
      description: description,
      measurementUnit: measurementUnit,
      code: code,
    );
  }
}
