import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/presentation/widgets/custom_button.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class TotalValueCartWidget extends StatelessWidget {
  const TotalValueCartWidget({
    super.key,
    required this.total,
    required this.onPressed,
    required this.text
  });

  final double total;
  final VoidCallback? onPressed;  
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        padding: AppPadding.pageWithPadding,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        width: CustomSize(context).width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GeneralTextWidget(LocalStrings().subTotal,
                    textStyle: const TextStyle(
                        fontSize: 17,
                        color: Colours.greyColor,
                        fontWeight: FontWeight.w600)),
                GeneralTextWidget("\$ ${total.toStringAsFixed(2)}",
                    textStyle: const TextStyle(
                        fontSize: 17,
                        color: Colours.greyColor,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GeneralTextWidget(LocalStrings().checkShop,
                    textStyle: const TextStyle(
                        fontSize: 17,
                        color: Colours.greyColor,
                        fontWeight: FontWeight.w600)),
                GeneralTextWidget("\$${LocalStrings().valueZero}",
                    textStyle: const TextStyle(
                        fontSize: 17,
                        color: Colours.greyColor,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: CustomSize(context).width,
              height: 5,
              decoration: BoxDecoration(
                  color: Colours.backgroundColor,
                  borderRadius: BorderRadius.circular(30)),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GeneralTextWidget(LocalStrings().totalCost,
                    textStyle: const TextStyle(
                        fontSize: 19,
                        color: Colours.greyColor,
                        fontWeight: FontWeight.w600)),
                GeneralTextWidget("\$${total.toStringAsFixed(2)}",
                    textStyle: const TextStyle(
                        fontSize: 17,
                        color: Colours.greyColor,
                        fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            CustomButton(text: text, onPressed: onPressed)
          ],
        ));
  }
}
