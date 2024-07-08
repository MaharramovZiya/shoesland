import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/data/models/product_model.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 250,
        width: 167,
        padding: const EdgeInsets.only(left: 8, bottom: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colours.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.rotate(
              angle: -5 * 3.140343 / 90,
              child: Image(
                image: AssetImage(product.imagePath),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GeneralTextWidget(
                  product.tag,
                  textStyle:
                      const TextStyle(fontSize: 13, color: Colours.blueColor),
                ),
                GeneralTextWidget(
                  product.name,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GeneralTextWidget(
                      "\$${product.price}",
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.black),
                    ),
                    GestureDetector(
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(20)),
                            color: Colours.blueColor),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
