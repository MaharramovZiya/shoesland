part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
  final Product product;

  const AddToCartEvent(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveFromCartEvent extends CartEvent {
  final Product product;
  const RemoveFromCartEvent(this.product);

  @override
  List<Object> get props => [product];
}

class IncreaseQuantityEvent extends CartEvent {
  final Product product;

  const IncreaseQuantityEvent(this.product);

  @override
  List<Object> get props => [product];
}

class DecreaseQuantityEvent extends CartEvent {
  final Product product;

  const DecreaseQuantityEvent(this.product);

  @override
  List<Object> get props => [product];
}
