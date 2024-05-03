import 'package:json_annotation/json_annotation.dart';

part 'access_token_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class AccessTokenModel{
  AccessTokenModel({
    this.accessToken = '',
  });

  final String accessToken;

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) => _$AccessTokenModelFromJson(json);

}