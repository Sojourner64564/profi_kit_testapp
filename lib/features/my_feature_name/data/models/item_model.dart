import 'package:json_annotation/json_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ItemModel{
  const ItemModel({
    this.id = '',
    this.name = '',
    this.description = '',
    this.measurementUnit = '',
    this.code = '',
  });
  final String id;
  final String name;
  final String description;
  final String measurementUnit;
  final String code;


  factory ItemModel.fromJson(Map<String,dynamic> json) => _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
