import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/presentation/routes/routes.dart';
import 'package:shoesland/presentation/screens/home/widgets/navigate_top_menu.dart';
import 'package:get/get.dart';

//I'm writing my NavigateTopMenu Widget here in list form, breaking it down into functions.

//Home Screen

Widget buildHomeNavigateTopMenu() {
  return NavigateTopMenu(
    leadingIcon: Icons.window_outlined,
    leadingOnPressed: () {},
    title: LocalStrings().location,
    customWidget: Text(LocalStrings().storeLocation),
    trallingIcon: Icons.shopping_bag_outlined,
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
        leadingIcon: Icons.shopping_bag_outlined,
        leadingOnPressed: () {
          Get.toNamed(Routes.cart);
        },
        trallingIcon: Icons.shopping_bag_outlined,
        trallingOnPressed: () {
          Get.toNamed(Routes.cart);
        },
        title: LocalStrings().detailPageTitle),
  );
}
//Cart Screen

Widget buildCartScreenNavigateTopMenu() {
  return NavigateTopMenu(
      trallingIcon: Icons.favorite_border,
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
    trallingIcon: Icons.favorite_border,
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
