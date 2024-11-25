part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeProductLikeButtonClicked extends HomeEvent{}

class HomeProductCartButtonClicked extends HomeEvent{}

class HomeProductLikeButtonNavigateEvent extends HomeEvent{}

class HomeProductCartButtonNavigateEvent extends HomeEvent{}