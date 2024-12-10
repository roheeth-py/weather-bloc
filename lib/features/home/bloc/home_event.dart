part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialFetchEvent extends HomeEvent{
  HomeInitialFetchEvent(this.item);

  final int item;
}

class HomeOnChangedEvent extends HomeEvent{
  HomeOnChangedEvent(this.item);
  final int item;
}
