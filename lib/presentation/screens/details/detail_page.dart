import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shoesland/core/components/active_button.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_images.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/data/models/product_model.dart';
import 'package:shoesland/logic/blocs/bloc/cart_bloc.dart';
import 'package:shoesland/presentation/routes/routes.dart';
import 'package:shoesland/presentation/screens/home/widgets/navigate_top_menu.dart';
import 'package:shoesland/presentation/widgets/custom_button.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key, required this.product});

  Product product;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with CustomDetailMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          onChanged: onChange,
          key: customKey,
          child: Column(
            children: [
              Padding(
                padding: AppPadding.pageWithPadding,
                child: NavigateTopMenu(
                    trallingIcon: Icons.shopping_bag_outlined,
                    trallingOnPressed: () {
                      Get.toNamed(Routes.cart);
                    },
                    leadingIcon: Icons.arrow_back_ios_new_outlined,
                    leadingOnPressed: () {
                      Get.back();
                    },
                    title: LocalStrings().detailPageTitle),
              ),
              Padding(
                  padding: AppPadding.pageWithPadding,
                  child: Transform.rotate(
                                 angle: -10 * 3.1415926535 / 90,

                    child: Image.asset(widget.product.imagePath))),
              _buildDescriptionWidget(context, widget.product, valueNotifier),
            ],
          ),
        ),
      )),
    );
  }
}

Widget _buildDescriptionWidget(
    BuildContext context, Product product, ValueNotifier valueNotifier) {
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
          //recommended shoes
          _buildRealtedShoesWidget(product),
          const SizedBox(height: 8),
          //shoes size text
          _buildSizeTitleWidget(),
          const SizedBox(
            height: 10,
          ),

          //shoes size
          _buildShoeSizeWidget(),
          const SizedBox(
            height: 20,
          ),
          _buildAddToCartWidget(context, product, valueNotifier)
        ],
      ),
    ),
  );
}

//Button add to cart
Widget _buildAddToCartWidget(
    BuildContext context, Product product, ValueNotifier valueNotifier) {
  //added to cart
  void showAddToCartDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
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
        },
      );

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
          child: ValueListenableBuilder(
            valueListenable: valueNotifier,
            builder: (context, value, child) {
              return CustomButton(
                  text: LocalStrings().addToCart,
                  onPressed: !value
                      ? null
                      : () {
                          context.read<CartBloc>().add(AddToCartEvent(product));
                          showAddToCartDialog(context);
                        });
            },
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(product: relatedProduct),
                  ));
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

//Added shoes to cart card design

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

//User will be select shoe size
Widget _buildShoeSizeWidget() {
  return ShoeSelectSizeWidget();
}
