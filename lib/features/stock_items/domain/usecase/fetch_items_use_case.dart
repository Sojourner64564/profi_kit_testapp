import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_kit_testapp/core/failure/failure.dart';
import 'package:profi_kit_testapp/features/stock_items/domain/entity/items_entity.dart';
import 'package:profi_kit_testapp/features/stock_items/domain/repository/fetch_items_repository.dart';

@injectable
class FetchItemsUseCase implements FetchItemsRepository{
  final FetchItemsRepository fetchItemsRepository;

  FetchItemsUseCase(this.fetchItemsRepository);

  @override
  Future<Either<Failure, ItemsEntity>> fetchItems(String login, String password, int page, int pageSize) async{
    return await fetchItemsRepository.fetchItems(login, password, page, pageSize);
  }

}