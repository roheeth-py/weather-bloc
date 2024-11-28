part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent{}

class CartItemRemoveEvent extends CartEvent{
  final ProductModel product;

  CartItemRemoveEvent({required this.product});
}

class CartButtonClicked extends CartEvent{}
