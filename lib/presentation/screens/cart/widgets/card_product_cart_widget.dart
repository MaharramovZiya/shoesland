import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/data/models/cart_item_model.dart';
import 'package:shoesland/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:shoesland/logic/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class CheckOutProductCart extends StatelessWidget {
  const CheckOutProductCart({
    super.key,
    required this.cartItem,
  });

  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    CustomSize size = CustomSize(context);
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(10),
      height: 130,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //IMAGE
          Row(
            children: [
              Container(
                height: size.height,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Colors.white,
                ),
                child: Transform.rotate(
                    angle: -5 * 3.1415926535 / 90,
                    child:
                        Image(image: AssetImage(cartItem.product.imagePath))),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GeneralTextWidget(
                    cartItem.product.name,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                  GeneralTextWidget(
                    '\$${cartItem.product.price}',
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context
                              .read<CartBloc>()
                              .add(DecreaseQuantityEvent(cartItem.product));
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: const Text(
                            "–",
                            style: TextStyle(fontSize: 22),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 11,
                      ),
                      GeneralTextWidget(cartItem.quantity.toString(),
                          textStyle: const TextStyle(fontSize: 16)),
                      const SizedBox(
                        width: 11,
                      ),
                      GestureDetector(
                        onTap: () {
                          context
                              .read<CartBloc>()
                              .add(IncreaseQuantityEvent(cartItem.product));
                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colours.blueColor),
                          child: const Text(
                            "+",
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    context
                        .read<FavoriteBloc>()
                        .add(AddToFavouriteEvent(cartItem.product));
                  },
                  icon: const Icon(
                    Icons.favorite_border,
                  )),
              IconButton(
                  style: const ButtonStyle(
                      foregroundColor: WidgetStatePropertyAll(Colors.red)),
                  onPressed: () {
                    context
                        .read<CartBloc>()
                        .add(RemoveFromCartEvent(cartItem.product));
                  },
                  icon: const Icon(
                    Icons.delete_outline_outlined,
                    size: 30,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
