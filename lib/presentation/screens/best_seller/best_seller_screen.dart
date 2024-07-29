import 'package:flutter/material.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/data/models/product_model.dart';
import 'package:shoesland/presentation/screens/best_seller/widgets/best_seller_cart_widget.dart';
import 'package:shoesland/presentation/screens/components/navigate_top_menu_tree.dart';

class BestSellerScreen extends StatelessWidget {
  const BestSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyUI(context),
    );
  }
}

Widget _buildBodyUI(context) {
  return SafeArea(
      child: Padding(
    padding: AppPadding.pageWithPadding,
    child: SingleChildScrollView(
      child: Column(
        children: [
          buildBestSellerNavigateTopMenu(context),
          const SizedBox(
            height: 25,
          ),
          _buildCallingBestSellerShoes(context)
        ],
      ),
    ),
  ));
}

Widget _buildCallingBestSellerShoes(context) {
  return GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    childAspectRatio: (120 / 195),
    physics: const ClampingScrollPhysics(),
    children: [
      for (int i = 0; i < productList.length; i++)
        BestSellerCartWidget(i: i),
    ],
  );
}

