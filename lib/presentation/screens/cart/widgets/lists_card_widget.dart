
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/logic/blocs/bloc/cart_bloc.dart';
import 'package:shoesland/presentation/screens/cart/widgets/card_product_cart_widget.dart';

class ListCardsWidget extends StatelessWidget {
  const ListCardsWidget({
    super.key,
    required this.size,
  });

  final CustomSize size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        if (state is CartUpdated) {
          final cartItems = state.cartItems;
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final cartItem = cartItems[index];
              return CheckOutProductCart(cartItem: cartItem);
            },
          );
        }
        return SizedBox(
          height: size.height / 1.5,
          child: Center(
            child: Text(LocalStrings().emptyCart),
          ),
        );
      },
    );
  }
}