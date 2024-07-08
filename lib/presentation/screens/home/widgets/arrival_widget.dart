import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/data/models/product_model.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class ArrivalWidget extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ArrivalWidget({
    required this.onTap,
    required this.product,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 160,
        width: CustomSize(context).width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colours.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Flexible(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
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
                            fontSize: 18,
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
                        ],
                      )
                    ],
                  )),
            ),
            Flexible(
                flex: 1,
                child: Transform.rotate(
                    angle: -7 * 3.14234 / 90,
                    child: Image(image: AssetImage(product.imagePath)))),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
