import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesland/data/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToCartEvent>(_updateCartItems);
    on<RemoveFromCartEvent>(_removeCartItems);
  }

  void _updateCartItems(AddToCartEvent event, Emitter<CartState> emit) {
    if (state is CartInitial) {
      emit(CartUpdated([event.product]));
    } else if (state is CartUpdated) {
      final updateCartItems =
          List<Product>.from((state as CartUpdated).cartItems);

      updateCartItems.add(event.product);

      emit(CartUpdated(updateCartItems));
    }
  }

  void _removeCartItems(RemoveFromCartEvent event, Emitter<CartState> emit) {
    if (state is CartUpdated) {
      final updateCartItems =
          List<Product>.from((state as CartUpdated).cartItems);

      updateCartItems.remove(event.product);

      emit(CartUpdated(updateCartItems));
    }
  }
}
