import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/logic/blocs/bloc/cart_bloc.dart';
import 'package:shoesland/presentation/routes/routes.dart';
import 'package:shoesland/presentation/screens/checkout/widgets/checkout_product_cart_widget.dart';
import 'package:shoesland/presentation/screens/home/widgets/navigate_top_menu.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: AppPadding.pageWithPadding,
          child: SingleChildScrollView(child: _buildUI(context)),
        ),
      ),
    );
  }
}

Widget _buildUI(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      //top menu
      _buildNavigateTopMenu(),

      //shoes list

      _buildCallingShoes(context)
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
      title: LocalStrings().myCart);
}

//Calling shoes

Widget _buildCallingShoes(context) {
  final CustomSize size = CustomSize(context);
  return BlocBuilder<CartBloc, CartState>(
    builder: (context, state) {
      if (state is CartUpdated) {
        final cartItems = state.cartItems;
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            final cartItem = cartItems[index];
            return CheckOutProductCart(size: size, cartItem: cartItem);
          },
        );
      }
      return SizedBox(
        height: size.height / 1.5,
        child: Center(
          child: Text(LocalStrings().emptyCart),
        ),
      );
    },
  );
}
