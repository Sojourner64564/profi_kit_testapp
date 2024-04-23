import 'package:json_annotation/json_annotation.dart';
import 'package:profi_kit_testapp/features/my_feature_name/data/models/item_model.dart';

part 'items_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ItemsModel{
  const ItemsModel({
    this.results = const [],
    this.total = 0,
  });
  final List<ItemModel> results;
  final int total;


  factory ItemsModel.fromJson(Map<String,dynamic> json) => _$ItemsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsModelToJson(this);
}
