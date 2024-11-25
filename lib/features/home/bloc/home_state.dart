part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeStateAction extends HomeState{}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState{}
class HomeLoadedSuccessState extends HomeState{}
class HomeErrorState extends HomeState{}

class HomeNavigateToWishlistPageActionState extends HomeStateAction{}
class HomeNavigateToCartPageActionState extends HomeStateAction{}
