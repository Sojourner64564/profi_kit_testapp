import 'package:profi_kit_testapp/features/my_feature_name/data/models/extension/extension_item_model_to_entety.dart';
import 'package:profi_kit_testapp/features/my_feature_name/data/models/items_model.dart';
import 'package:profi_kit_testapp/features/my_feature_name/domain/entity/items_entity.dart';

extension ItemsToEntityExtension on ItemsModel{
  ItemsEntity toEntity(){
    return ItemsEntity(
      results: results.map((e) => e.toEntity(e)).toList(),
      total: total,
    );
  }
}