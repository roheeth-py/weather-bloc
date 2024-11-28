import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/cart/bloc/cart_bloc.dart';
import 'package:weather_app/features/cart/ui/cart_tile.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    // TODO: implement initState
    cartBloc.add(CartInitialEvent());
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    cartBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (prev, current) => current is CartActionState,
        buildWhen: (prev, current) => current is! CartActionState,
        listener: (context, state) {
          // TODO: implement listener
          if(state is CartButtonClickedActionState){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Removed")));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                  itemCount: successState.cartItems.length,
                  itemBuilder: (ctx, item) {
                    return CartTile(
                        productModel: successState.cartItems[item],
                        cartBloc: cartBloc);
                  });
            default:
              return Container();
          }
        },
      ),
    );
  }
}
