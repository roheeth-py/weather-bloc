part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent{}

class HomeProductLikeButtonClicked extends HomeEvent{
  final ProductModel clickedProduct;

  HomeProductLikeButtonClicked({required this.clickedProduct});
}

class HomeProductCartButtonClicked extends HomeEvent{
  final ProductModel clickedProduct;

  HomeProductCartButtonClicked({required this.clickedProduct});
}

class HomeProductLikeButtonNavigateEvent extends HomeEvent{}
class HomeProductCartButtonNavigateEvent extends HomeEvent{}