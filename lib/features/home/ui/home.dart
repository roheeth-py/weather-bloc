import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/cart/ui/cart.dart';
import 'package:weather_app/features/home/bloc/home_bloc.dart';
import 'package:weather_app/features/home/ui/product_tile.dart';
import 'package:weather_app/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current){
        return current is HomeStateAction;
      },
      buildWhen: (previous, current){
        return current is! HomeStateAction;
      },
      listener: (context, state) {
        if(state is HomeNavigateToCartPageActionState){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Cart()));
          print(1);
        }else if(state is HomeNavigateToWishlistPageActionState){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Wishlist()));
          print(2);
        }else if(state is HomeWishListAddedActionState){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.clickedProduct.name} added to Wishlist")));
        }else if(state is HomeCartAddedActionState){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.clickedProduct.name} added to Cart")));
        }else if(state is HomeWishListRemovedActionState){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.clickedProduct.name} removed to Wishlist")));
        }else if(state is HomeCartRemovedActionState){
          ScaffoldMessenger.of(context).removeCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${state.clickedProduct.name} removed to Cart")));
        }
      },
      builder: (context, state) {
        switch(state.runtimeType){
          case HomeLoadingState :
            return Scaffold(body: Center(child: CircularProgressIndicator(),),);
          case HomeLoadedSuccessState:
            final HomeLoadedSuccessState successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Roheeth Grocery List"),
                actions: [
                  IconButton(onPressed: (){
                    homeBloc.add(HomeProductLikeButtonNavigateEvent());
                  }, icon: const Icon(Icons.favorite),),
                  IconButton(onPressed: (){
                    homeBloc.add(HomeProductCartButtonNavigateEvent());
                  }, icon: const Icon(Icons.shopping_cart),),
                ],
              ),
              body: ListView.builder(itemCount: successState.products.length, itemBuilder: (ctx, int){
                return ProductTile(homeBloc: homeBloc, productModel: successState.products[int]);
              }),
            );
          case HomeErrorState:
            return Scaffold();
          default:
            return Scaffold();
        }
      },
    );
  }
}