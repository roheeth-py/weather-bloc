import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/home/bloc/home_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc homeBloc = HomeBloc();
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current){
        return current is HomeStateAction;
      },
      buildWhen: (previous, current){
        return current is! HomeStateAction;
      },
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
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
        );
      },
    );
  }
}