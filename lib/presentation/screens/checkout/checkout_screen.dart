import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/data/models/product_model.dart';
import 'package:shoesland/presentation/routes/routes.dart';
import 'package:shoesland/presentation/screens/home/widgets/navigate_top_menu.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.pageWithPadding,
          child: SingleChildScrollView(child: _buildUI()),
        ),
      ),
    );
  }
}

Widget _buildUI() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      //top menu
      _buildNavigateTopMenu(),

      //shoes list

      _buildCallingShoes()
    ],
  );
}

//Navigate top menu

Widget _buildNavigateTopMenu() {
  return NavigateTopMenu(
      trallingIcon: Icons.favorite_border,
      trallingOnPressed: () {
        Get.toNamed(Routes.favourites);
      },
      leadingIcon: Icons.arrow_back_ios_new_rounded,
      leadingOnPressed: () {
        Get.back();
      },
      title: "My Cart");
}

//Calling shoes

Widget _buildCallingShoes() {
  return ListView.builder(
    shrinkWrap: true,
    primary: false,
    itemCount: productList.length,
    itemBuilder: (context, index) {
      final product = productList[index];
      return ListTile(
        leading: Image(image: AssetImage(product.imagePath)),
        title: Text(product.tag),
        subtitle: Text(product.price.toString()),
      );
    },
  );
}
