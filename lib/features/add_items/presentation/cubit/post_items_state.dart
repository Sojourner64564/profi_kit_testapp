part of 'post_items_cubit.dart';

@immutable
abstract class PostItemsState {}

class PostItemsInitialState extends PostItemsState {}
class PostItemsInitialChecking extends PostItemsState {}
class PostItemsInitialChecked extends PostItemsState {}
class PostItemsInitialError extends PostItemsState {}
