import 'package:profi_kit_testapp/features/my_feature_name/data/models/item_model.dart';
import 'package:profi_kit_testapp/features/my_feature_name/domain/entity/item_entity.dart';

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
