import 'package:profi_kit_testapp/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:profi_kit_testapp/features/my_feature_name/domain/entity/items_entity.dart';

abstract class FetchItemsRepository{
    Future<Either<Failure, ItemsEntity>> fetchItems(String login, String password, int page, int pageSize);
}