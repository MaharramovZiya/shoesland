import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/data/models/product_model.dart';
import 'package:shoesland/data/models/shoe_size_model.dart';
import 'package:shoesland/logic/cubits/select_shoe_size.dart';
import 'package:shoesland/presentation/screens/home/widgets/navigate_top_menu.dart';
import 'package:shoesland/presentation/widgets/custom_button.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key, required this.product});

  Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: AppPadding.pageWithPadding,
              child: NavigateTopMenu(
                  trallingIcon: Icons.shopping_bag_outlined,
                  trallingOnPressed: () {},
                  leadingIcon: Icons.arrow_back_ios_new_outlined,
                  leadingOnPressed: () {
                    Get.back();
                  },
                  title: "Men's Shoes"),
            ),
            Padding(
                padding: AppPadding.pageWithPadding,
                child: Image.asset(product.imagePath)),
            _buildDescriptionWidget(context, product),
          ],
        ),
      )),
    );
  }
}

Widget _buildDescriptionWidget(BuildContext context, Product product) {
  return ClipRRect(
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
    child: Container(
      color: Colors.white,
      padding: AppPadding.pageWithPadding,
      width: CustomSize(context).width,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GeneralTextWidget(
            product.tag,
            textStyle: const TextStyle(color: Colours.blueColor),
          ),
          GeneralTextWidget(
            product.name,
            textStyle:
                const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 6,
          ),
          GeneralTextWidget(
            "\$${product.price}",
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 7,
          ),
          GeneralTextWidget(
            product.description,
            textStyle: const TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 7,
          ),
          GeneralTextWidget(
            LocalStrings().gallery,
            textStyle: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          _buildRealtedShoesWidget(product),
          const SizedBox(height: 8),
          _buildSizeTitleWidget(),
          const SizedBox(
            height: 10,
          ),

          //shoes size
          _buildShoeSizeWidget(),
          const SizedBox(
            height: 20,
          ),
          _buildAddToCartWidget(
            context,
            product
          )
        ],
      ),
    ),
  );
}

Widget _buildAddToCartWidget(BuildContext context,Product product) {
  return Container(
    width: CustomSize(context).width,
    decoration: const BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GeneralTextWidget(
              LocalStrings().price,
              textStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            GeneralTextWidget(
              "\$${product.price}",
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          width: CustomSize(context).width / 2,
          child: CustomButton(
            text: LocalStrings().addToCart,
            onPressed: () {},
          ),
        ),
      ],
    ),
  );
}

Widget _buildRealtedShoesWidget(Product product) {
  List<Product> filteredProducts = productList
      .where((prod) => prod.categoryTag == product.categoryTag)
      .toList();
  return SizedBox(
    height: 60,
    child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          Product relatedProduct = filteredProducts[index];
          return GestureDetector(
            onTap: () {
              Get.to(DetailScreen(product: relatedProduct));
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(relatedProduct.imagePath)),
                  borderRadius: BorderRadius.circular(10),
                  color: Colours.backgroundColor),
            ),
          );
        }),
  );
}

Widget _buildSizeTitleWidget() {
  return Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GeneralTextWidget(
        LocalStrings().size,
        textStyle: const TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Row(
        children: [
          GeneralTextWidget(
            LocalStrings().eu,
            textStyle: const TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 7,
          ),
          GeneralTextWidget(
            LocalStrings().us,
            textStyle: const TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 7,
          ),
          GeneralTextWidget(
            LocalStrings().uk,
            textStyle: const TextStyle(
                color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ],
  );
}

Widget _buildShoeSizeWidget() {
  return BlocProvider(
    create: (context) => ShoeSizeCubit(),
    child: BlocBuilder<ShoeSizeCubit, List<ShoeSizeModel>>(
      builder: (context, shoeList) {
        return SizedBox(
          height: 70,
          // width: 70,
          child: ListView.builder(
            itemCount: shoeList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final shoeSizeIndex = shoeList[index];
              return GestureDetector(
                onTap: () {
                  context.read<ShoeSizeCubit>().toggleSelectSize(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        boxShadow: [
                          shoeSizeIndex.isSelected
                              ? BoxShadow(
                                  color:
                                      const Color(0xFF5B9EE1).withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3),
                                )
                              : const BoxShadow(),
                        ],
                        color: shoeSizeIndex.isSelected
                            ? Colours.blueColor
                            : Colours.white,
                        borderRadius: BorderRadius.circular(40)),
                    child: Center(
                        child: Text(
                      shoeSizeIndex.size,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: shoeSizeIndex.isSelected
                              ? Colors.white
                              : Colors.black),
                    )),
                  ),
                ),
              );
            },
          ),
        );
      },
    ),
  );
}
