import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shoesland/data/models/cart_item_model.dart';
import 'package:shoesland/data/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<AddToCartEvent>(_updateCartItems);
    on<RemoveFromCartEvent>(_removeFromCartItems);
    on<IncreaseQuantityEvent>(_onIncrementQuantity);
    on<DecreaseQuantityEvent>(_onDecrementQuantity);
  }

  void _updateCartItems(AddToCartEvent event, Emitter<CartState> emit) {
    if (state is CartInitial) {
      emit(CartUpdated([CartItem(product: event.product, quantity: 1)]));
    } else if (state is CartUpdated) {
      final updatedCartItems =
          List<CartItem>.from((state as CartUpdated).cartItems);

      final existingItemIndex = updatedCartItems
          .indexWhere((item) => item.product.id == event.product.id);

      if (existingItemIndex != -1) {
        updatedCartItems[existingItemIndex].quantity++;
      } else {
        updatedCartItems.add(CartItem(product: event.product, quantity: 1));
      }

      emit(CartUpdated(updatedCartItems));
    }
  }

  void _removeFromCartItems(
      RemoveFromCartEvent event, Emitter<CartState> emit) {
    if (state is CartUpdated) {
      final updatedCartItems =
          List<CartItem>.from((state as CartUpdated).cartItems);

      updatedCartItems
          .removeWhere((item) => item.product.id == event.product.id);

      emit(CartUpdated(updatedCartItems));
    }
  }

 void _onIncrementQuantity(IncreaseQuantityEvent event, Emitter<CartState> emit) {
    if (state is CartUpdated) {
      final updatedCartItems = (state as CartUpdated).cartItems.map((item) {
        if (item.product == event.product) {
          return CartItem(product: item.product, quantity: item.quantity + 1);
        }
        return item;
      }).toList();

      emit(CartUpdated(updatedCartItems));
    }
  }

  void _onDecrementQuantity(DecreaseQuantityEvent event, Emitter<CartState> emit) {
    if (state is CartUpdated) {
      final updatedCartItems = (state as CartUpdated).cartItems.map((item) {
        if (item.product == event.product && item.quantity > 1) {
          return CartItem(product: item.product, quantity: item.quantity - 1);
        }
        return item;
      }).toList();

      emit(CartUpdated(updatedCartItems));
    }
  }
}
