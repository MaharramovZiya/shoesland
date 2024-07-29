import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesland/data/models/product_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc() : super(FavoriteInitial()) {
    on<AddToFavouriteEvent>(_onUpdateFavouriteItems);
    on<DeleteFavouriteEvent>(_onDeleteFavouirtes);
  }

  void _onUpdateFavouriteItems(
      AddToFavouriteEvent event, Emitter<FavoriteState> emit) {
    if (state is FavoriteInitial) {
      emit(FavoriteUpdated([event.product]));
    } else if (state is FavoriteUpdated) {
      final updateFavoriteItems =
          List<Product>.from((state as FavoriteUpdated).productList);

      updateFavoriteItems.add(event.product);

      emit(FavoriteUpdated(updateFavoriteItems));
    }
  }

  void _onDeleteFavouirtes(
      DeleteFavouriteEvent event, Emitter<FavoriteState> emit) {
    if (state is FavoriteUpdated) {
      emit(FavoriteUpdated([]));
    }
  }
}
