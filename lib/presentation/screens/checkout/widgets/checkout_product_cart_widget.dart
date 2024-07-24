import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/data/models/product_model.dart';
import 'package:shoesland/logic/blocs/bloc/cart_bloc.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class CheckOutProductCart extends StatelessWidget {
  const CheckOutProductCart({
    super.key,
    required this.size,
    required this.cartItem,
  });

  final CustomSize size;
  final Product cartItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: const EdgeInsets.all(10),
      height: 140,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Row(
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
                    child: Image(image: AssetImage(cartItem.imagePath))),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GeneralTextWidget(
                    cartItem.name,
                    textStyle:
                        const TextStyle(fontWeight: FontWeight.w600, fontSize: 19),
                  ),
                  GeneralTextWidget(
                    '\$${cartItem.price}',
                    textStyle:
                        const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
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
                      GeneralTextWidget("1",
                          textStyle: const TextStyle(fontSize: 16)),
                      const SizedBox(
                        width: 11,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.only(left: 8, right: 8),
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "40",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    context.read<CartBloc>().add(RemoveFromCartEvent(cartItem));
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
