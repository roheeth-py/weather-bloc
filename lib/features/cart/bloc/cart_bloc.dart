import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/features/home/models/home_product_data_model.dart';

import '../../../data/cart_items.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartItemRemoveEvent>(cartItemRemoveEvent);
  }

  FutureOr<void> cartInitialEvent(CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItem));
  }

  FutureOr<void> cartItemRemoveEvent(CartItemRemoveEvent event, Emitter<CartState> emit) {
    cartItem.remove(event.product);
    emit(CartSuccessState(cartItems: cartItem));
    // emit(CartButtonClickedActionState());
  }
}
