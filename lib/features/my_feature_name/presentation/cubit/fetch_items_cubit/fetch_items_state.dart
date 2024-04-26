part of 'fetch_items_cubit.dart';

@immutable
abstract class FetchItemsState {}

class FetchItemsStateInitial extends FetchItemsState {}
class FetchItemsStateLoading extends FetchItemsState {}
class FetchItemsStateLoaded extends FetchItemsState {
  final ItemsEntity entity;

  FetchItemsStateLoaded(this.entity);
}
class FetchItemsStateEmpty extends FetchItemsState {}
class FetchItemsStateError extends FetchItemsState {}
