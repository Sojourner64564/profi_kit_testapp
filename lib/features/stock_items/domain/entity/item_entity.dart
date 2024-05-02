import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable{
  const ItemEntity({
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

  @override
  List<Object?> get props => [];
}
