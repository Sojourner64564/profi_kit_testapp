part of 'update_pager_cubit.dart';

@immutable
abstract class UpdatePagerState {}

class UpdatePagerStateInitial extends UpdatePagerState {}

class UpdatePagerStateLoading extends UpdatePagerState {}

class UpdatePagerStateLoaded extends UpdatePagerState {
  final int lenght;
  final List<Color> borderColor;

  UpdatePagerStateLoaded(this.lenght, this.borderColor);
}

class UpdatePagerStateEmpty extends UpdatePagerState {}

class UpdatePagerStateError extends UpdatePagerState {}
