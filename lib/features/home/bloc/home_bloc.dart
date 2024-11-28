import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/cart_items.dart';
import 'package:weather_app/data/wishlist_items.dart';
import 'package:weather_app/features/home/models/home_product_data_model.dart';

import '../../../data/grocery_data.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);

    on<HomeProductLikeButtonClicked>(homeProductLikeButtonClicked);
    on<HomeProductCartButtonClicked>(homeProductCartButtonClicked);

    on<HomeProductLikeButtonNavigateEvent>(homeProductLikeButtonNavigateEvent);
    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
  }

  Future<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      HomeLoadedSuccessState(
        products: GroceryData.groceryProducts.map((e) {
          return ProductModel(
              id: e["id"],
              name: e["name"],
              price: e["price"],
              category: e["category"],
              quantity: e["quantity"],
              image: e["image"]);
        }).toList(),
      ),
    );
  }

  FutureOr<void> homeProductLikeButtonNavigateEvent(
      HomeProductLikeButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Like button");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(
      HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Cart Button");
    emit(HomeNavigateToCartPageActionState());
  }

  FutureOr<void> homeProductLikeButtonClicked(
      HomeProductLikeButtonClicked event, Emitter<HomeState> emit) {
    print("like");
    if(!wishlistItem.contains(event.clickedProduct)){
      wishlistItem.add(event.clickedProduct);
      emit(HomeWishListAddedActionState(event.clickedProduct));
    }else{
      wishlistItem.remove(event.clickedProduct);
      emit(HomeWishListRemovedActionState(event.clickedProduct));
    }
  }

  FutureOr<void> homeProductCartButtonClicked(
      HomeProductCartButtonClicked event, Emitter<HomeState> emit) {
    print("cart");
    cartItem.add(event.clickedProduct);
    print(cartItem);
    emit(HomeCartAddedActionState(event.clickedProduct));
  }
}
