import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/presentation/routes/routes.dart';
import 'package:shoesland/presentation/screens/home/widgets/navigate_top_menu.dart';
import 'package:get/get.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

//I'm writing my NavigateTopMenu Widget here in list form, breaking it down into functions.

//Home Screen

Widget buildHomeNavigateTopMenu() {
  return NavigateTopMenu(
    leadingIcon: Icons.window_outlined,
    leadingOnPressed: () {},
    title: LocalStrings().location,
    customWidget: Text(LocalStrings().storeLocation),
    trallingIcon: const Icon(Icons.shopping_bag_outlined),
    trallingOnPressed: () {
      Get.toNamed(Routes.checkout);
    },
  );
}

//Detail Screen

Widget buildDetailScreenNavigateTopMenu() {
  return Padding(
    padding: AppPadding.pageWithPadding,
    child: NavigateTopMenu(
        leadingIcon: Icons.arrow_back_ios_new_rounded,
        leadingOnPressed: () {
          Get.back();
        },
        trallingIcon: const Icon(Icons.shopping_bag_outlined),
        trallingOnPressed: () {
          Get.toNamed(Routes.cart);
        },
        title: LocalStrings().detailPageTitle),
  );
}
//Cart Screen

Widget buildCartScreenNavigateTopMenu() {
  return NavigateTopMenu(
      trallingIcon: const Icon(Icons.favorite_border),
      trallingOnPressed: () {
        Get.toNamed(Routes.favourites);
      },
      leadingIcon: Icons.arrow_back_ios_new_rounded,
      leadingOnPressed: () {
        Get.back();
      },
      title: LocalStrings().myCart);
}
//Checkout Screen

Widget bulildCheckoutNavigateTopMenu() {
  return NavigateTopMenu(
    trallingIcon: const Icon(Icons.favorite_border),
    trallingOnPressed: () {
      Get.toNamed(Routes.favourites);
    },
    leadingIcon: Icons.arrow_back_ios_new_rounded,
    leadingOnPressed: () {
      Get.back();
    },
    title: LocalStrings().checkOut,
  );
}

//Notifaction screen

Widget buildNotifactionNavigateTopMenu(VoidCallback trallingOnPressed) {
  return NavigateTopMenu(
      leadingIcon: Icons.arrow_back_ios_new_rounded,
      leadingOnPressed: () {
        Get.back();
      },
      trallingOnPressed:trallingOnPressed,
      trallingIcon: GeneralTextWidget(
          textStyle: const TextStyle(color: Colours.blueColor), "Clear All"),
      title: LocalStrings().notifacationTitle);
}