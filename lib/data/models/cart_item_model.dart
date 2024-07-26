import 'package:equatable/equatable.dart';
import 'package:shoesland/data/models/product_model.dart';

class CartItem extends Equatable {
  final Product product;
   int quantity;

  CartItem({required this.product, required this.quantity});

  CartItem copyWith({Product? product, int? quantity}) {
    return CartItem(
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object> get props => [product, quantity];
}
