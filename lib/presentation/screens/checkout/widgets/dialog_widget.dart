import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_images.dart';
import 'package:shoesland/core/constants/local_strings.dart';


class CheckoutDialogWidget extends StatelessWidget {
  const CheckoutDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                right: 10,
                top: 10,
                child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.clear_rounded,
                      color: Colors.black,
                    ))),
            Container(
              width: CustomSize(context).width,
              height: 200,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Column(
                children: [
                  Lottie.asset(LocalImages.soldLottie, width: 130),
                  Text(
                    LocalStrings().paymentSuccess,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              )),
            ),
          ],
        ));
  }
}