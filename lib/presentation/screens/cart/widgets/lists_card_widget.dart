import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_images.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:shoesland/presentation/screens/cart/widgets/card_product_cart_widget.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(LocalImages.cart),
                Align(
                  alignment: Alignment.center,
                  child: GeneralTextWidget(
                    LocalStrings().emptyCart,
                    textAlign: TextAlign.center,
                    textStyle: const TextStyle(
                        color: Colours.blackLikeToColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
