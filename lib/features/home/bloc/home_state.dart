part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeStateAction extends HomeState{}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}

class HomeLoadedSuccessState extends HomeState{
  HomeLoadedSuccessState({required this.products});

  final List<ProductModel> products;
}

class HomeErrorState extends HomeState{}

class HomeNavigateToWishlistPageActionState extends HomeStateAction{}
class HomeNavigateToCartPageActionState extends HomeStateAction{}

class HomeWishListAddedActionState extends HomeStateAction{
  HomeWishListAddedActionState(this.clickedProduct);
  final ProductModel clickedProduct;
}
class HomeCartAddedActionState extends HomeStateAction{
  HomeCartAddedActionState(this.clickedProduct);
  final ProductModel clickedProduct;
}

class HomeWishListRemovedActionState extends HomeStateAction{
  HomeWishListRemovedActionState(this.clickedProduct);
  final ProductModel clickedProduct;
}
class HomeCartRemovedActionState extends HomeStateAction{
  HomeCartRemovedActionState(this.clickedProduct);
  final ProductModel clickedProduct;
}
