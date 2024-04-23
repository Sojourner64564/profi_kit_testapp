import 'package:json_annotation/json_annotation.dart';

part 'bodymodel.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Bodymodel {
  const Bodymodel({
    this.admin = '',
    this.password = '',
  });

  final String admin;
  final String password;

  factory Bodymodel.fromJson(Map<String, dynamic> json) => _$BodymodelFromJson(json);


}
