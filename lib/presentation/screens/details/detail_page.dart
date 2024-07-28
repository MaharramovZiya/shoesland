import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/core/components/active_button.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/data/models/product_model.dart';
import 'package:shoesland/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:shoesland/presentation/screens/components/navigate_top_menu_tree.dart';
import 'package:shoesland/presentation/screens/components/show_add_dialog_global.dart';
import 'package:shoesland/presentation/screens/details/widgets/addto_cart_widget.dart';
import 'package:shoesland/presentation/screens/details/widgets/realted_show_widget.dart';
import 'package:shoesland/presentation/screens/details/widgets/static_detail_size_widget.dart';
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
              buildDetailScreenNavigateTopMenu(),
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
                          showCustomAddToCartDialog(
                              context, const AddToCartDialogWidget());
                        });
            },
          ),
        ),
      ],
    ),
  );
}

//Realted shoes
Widget _buildRealtedShoesWidget(Product product) {
  List<Product> filteredProducts = productList
      .where((prod) => prod.categoryTag == product.categoryTag)
      .toList();
  return RealtedShoesWidget(filteredProducts: filteredProducts);
}

//Added shoes to cart card design

Widget _buildSizeTitleWidget() {
  return const DetailSizeTitleWidget();
}

//User will be select shoe size
Widget _buildShoeSizeWidget() {
  return ShoeSelectSizeWidget();
}
