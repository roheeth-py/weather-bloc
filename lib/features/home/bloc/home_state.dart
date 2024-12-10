part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeSuccessState extends HomeState {
  final Object data;
  final FiveDayWeatherData? fiveDay;


  HomeSuccessState(
      {required this.data, this.fiveDay});
}

class HomeErrorState extends HomeState {
  final dynamic e;

  HomeErrorState({required this.e});
}
