import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/data/models/product_model.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class NotificationCartWidget extends StatelessWidget {
  const NotificationCartWidget({
    super.key,
    required this.lastTwoProducts,
    required this.random,
    required this.time,
    required this.title,
    required this.customSize,
  });

  final List<Product> lastTwoProducts;
  final Random random;
  final CustomSize customSize;
  final String time;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GeneralTextWidget(title,
              textStyle:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          ListView.builder(
            itemCount: lastTwoProducts.length,
            shrinkWrap: true,
            primary: false,
            itemBuilder: (context, index) {
              final product = lastTwoProducts[index];
              final timeAgo = time == "min"
                  ? "${random.nextInt(59) + 1} min ago"
                  : "${random.nextInt(6) + 1} days ago";
              return Container(
                width: customSize.width,
                padding: const EdgeInsets.all(8),
                height: 120,
                color: Colors.transparent,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 90,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: Transform.rotate(
                        angle: 3.14920 * -40,
                        child: Image(
                          image: AssetImage(product.imagePath),
                          width: 90,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GeneralTextWidget(product.productAds,
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              GeneralTextWidget("\$${product.price}",
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                              const SizedBox(
                                width: 20,
                              ),
                              GeneralTextWidget("$timeAgo ",
                                  textStyle: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13)),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
