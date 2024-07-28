import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:shoesland/presentation/screens/checkout/widgets/dialog_widget.dart';
import 'package:shoesland/presentation/screens/checkout/widgets/payment_info_widget.dart';
import 'package:shoesland/presentation/screens/cart/widgets/custom_float_action_btn.dart';
import 'package:shoesland/presentation/screens/cart/widgets/total_value_widget.dart';
import 'package:shoesland/presentation/screens/components/navigate_top_menu_tree.dart';
import 'package:shoesland/presentation/screens/components/show_add_dialog_global.dart';
import 'package:shoesland/presentation/screens/components/show_modal_bottom_sheet.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: CustomFloatActionButton(
            onPressed: () {
              showCustomModalBottomSheet(context, _buildTotalValue(context));
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
     bulildCheckoutNavigateTopMenu(),
      const SizedBox(
        height: 29,
      ),
      CheckoutPaymentInformationWidget(customSize: customSize)
    ],
  );
}
BlocBuilder<CartBloc, CartState> _buildTotalValue(context) {
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
              showCustomAddToCartDialog(context, const CheckoutDialogWidget());
            },
            total: total);
      }
      return const Center(child: CircularProgressIndicator());
    },
  );
}
