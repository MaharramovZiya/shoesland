
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoesland/core/constants/local_images.dart';
import 'package:shoesland/core/constants/local_strings.dart';

class AddToCartDialogWidget extends StatelessWidget {
  const AddToCartDialogWidget({
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
              width: 180,
              height: 180,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Center(
                  child: Column(
                children: [
                  Lottie.asset(LocalImages.completedOrder, width: 130),
                  Text(
                    LocalStrings().addedShoe,
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