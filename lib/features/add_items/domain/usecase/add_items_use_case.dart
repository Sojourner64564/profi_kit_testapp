import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_kit_testapp/core/failure/failure.dart';
import 'package:profi_kit_testapp/features/add_items/domain/entity/item_entity.dart';
import 'package:profi_kit_testapp/features/add_items/domain/repository/add_items_repository.dart';

@injectable
class AddItemsUseCase implements AddItemsRepository{
  final AddItemsRepository addItemsRepository;

  AddItemsUseCase(this.addItemsRepository);
  @override
  Future<Either<Failure, ItemEntity>> addItems(String login, String password, String name, String description, String measurementUnits, String code) async{
    return await addItemsRepository.addItems(login, password, name, description, measurementUnits, code);
  }

}