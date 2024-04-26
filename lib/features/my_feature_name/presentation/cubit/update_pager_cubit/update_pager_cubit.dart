import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:profi_kit_testapp/core/injectable/injectable.dart';
import 'package:profi_kit_testapp/features/my_feature_name/domain/entity/items_entity.dart';
import 'package:profi_kit_testapp/features/my_feature_name/presentation/cubit/fetch_items_cubit/fetch_items_cubit.dart';

part 'update_pager_state.dart';

@lazySingleton
class UpdatePagerCubit extends Cubit<UpdatePagerState> {
  UpdatePagerCubit() : super(UpdatePagerInitial());

  Future<void> updatePager(int pageSize, ItemsEntity itemsEntity) async{
    final totalItems = itemsEntity.total;
    final totalPages = totalItems~/pageSize;



  }

}
