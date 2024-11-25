import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductLikeButtonNavigateEvent>(homeProductLikeButtonNavigateEvent);
    on<HomeProductCartButtonNavigateEvent>(homeProductCartButtonNavigateEvent);
  }

  FutureOr<void> homeProductLikeButtonNavigateEvent(HomeProductLikeButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Like button");
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeProductCartButtonNavigateEvent(HomeProductCartButtonNavigateEvent event, Emitter<HomeState> emit) {
    print("Cart Button");
  }
}
