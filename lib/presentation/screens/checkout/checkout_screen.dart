import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/logic/blocs/bloc/cart_bloc.dart';
import 'package:shoesland/presentation/routes/routes.dart';
import 'package:shoesland/presentation/screens/checkout/widgets/dialog_widget.dart';
import 'package:shoesland/presentation/screens/checkout/widgets/payment_info_widget.dart';
import 'package:shoesland/presentation/screens/cart/widgets/custom_float_action_btn.dart';
import 'package:shoesland/presentation/screens/cart/widgets/total_value_widget.dart';
import 'package:shoesland/presentation/screens/home/widgets/navigate_top_menu.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: CustomFloatActionButton(
            onPressed: () {
              _showModalBottomSheet(context);
            },
            icon: Icons.payment_rounded),
        body: SafeArea(
            child: Padding(
          padding: AppPadding.pageWithPadding,
          child: SingleChildScrollView(
            child: _buildUI(context),
          ),
        )));
  }
}

Widget _buildUI(BuildContext context) {
  CustomSize customSize = CustomSize(context);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      _buildNavigateTopMenu(),
      const SizedBox(
        height: 29,
      ),
      CheckoutPaymentInformationWidget(customSize: customSize)
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
      title: LocalStrings().checkOut);
}

BlocBuilder<CartBloc, CartState> _buildTotalValue() {
  void showAddToCartDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          return const CheckoutDialogWidget();
        },
      );
  return BlocBuilder<CartBloc, CartState>(
    builder: (context, state) {
      if (state is CartUpdated) {
        final total = state.cartItems.fold<double>(
          0,
          (sum, item) => sum + (item.product.price * item.quantity),
        );

        return TotalValueCartWidget(
            text: LocalStrings().paymentTxt,
            onPressed: () {
              showAddToCartDialog(context);
            },
            total: total);
      }
      return const Center(child: CircularProgressIndicator());
    },
  );
}


void _showModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (context) {
      return _buildTotalValue();
    },
  );
}
