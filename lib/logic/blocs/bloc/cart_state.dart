part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

// final class CartUpdated extends CartState {
//   final List<Product> cartItems;

//   const CartUpdated(this.cartItems);

//   @override
//   List<Object> get props => [cartItems];
// }

//cart item state

final class CartUpdated extends CartState {
  final List<CartItem> cartItems;

  CartUpdated(this.cartItems);
    @override
  List<Object> get props => [cartItems];
}
