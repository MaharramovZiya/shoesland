part of 'favorite_bloc.dart';

sealed class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object> get props => [];
}

class AddToFavouriteEvent extends FavoriteEvent {
  final Product product;
  const AddToFavouriteEvent(this.product);
  @override
  List<Object> get props => [product];
}

class DeleteFavouriteEvent extends FavoriteEvent {
  const DeleteFavouriteEvent();
  @override
  List<Object> get props => [];
}
