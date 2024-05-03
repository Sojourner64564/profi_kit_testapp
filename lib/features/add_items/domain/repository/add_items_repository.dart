import 'package:profi_kit_testapp/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:profi_kit_testapp/features/add_items/domain/entity/item_entity.dart';

abstract class AddItemsRepository{
  Future<Either<Failure, ItemEntity>> addItems(String login, String password, String name, String description, String measurementUnits, String code);
}