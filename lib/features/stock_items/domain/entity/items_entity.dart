import 'package:equatable/equatable.dart';
import 'package:profi_kit_testapp/features/stock_items/domain/entity/item_entity.dart';

class ItemsEntity extends Equatable{
  const ItemsEntity({
    this.results = const [],
    this.total = 0,
  });
  final List<ItemEntity> results;
  final int total;


  @override
  List<Object?> get props => [results, total];
}
