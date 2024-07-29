part of 'favorite_bloc.dart';

sealed class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteUpdated extends FavoriteState {
  final List<Product> productList;

  FavoriteUpdated(this.productList);
  @override
  List<Object> get props => [productList];
}

//Empty loaded state
