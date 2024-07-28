import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:shoesland/presentation/routes/routes.dart';
import 'package:shoesland/presentation/screens/cart/widgets/custom_float_action_btn.dart';
import 'package:shoesland/presentation/screens/cart/widgets/lists_card_widget.dart';
import 'package:shoesland/presentation/screens/cart/widgets/total_value_widget.dart';
import 'package:shoesland/presentation/screens/components/navigate_top_menu_tree.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatActionButton(
        onPressed: () {
          _showModalBottomSheet(context);
        },
        icon: Icons.shopping_bag_outlined,
      ),
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
      buildCartScreenNavigateTopMenu(),

      //shoes list

      _buildCallingShoes(context),
    ],
  );
}

BlocBuilder<CartBloc, CartState> _buildTotalValue() {
  return BlocBuilder<CartBloc, CartState>(
    builder: (context, state) {
      if (state is CartUpdated) {
        final total = state.cartItems.fold<double>(
          0,
          (sum, item) => sum + (item.product.price * item.quantity),
        );

        return TotalValueCartWidget(
          text: LocalStrings().checkOut,
            onPressed: () {
              Get.toNamed(Routes.checkout);
            },
            total: total);
      }
      return const Center(child: CircularProgressIndicator());
    },
  );
}

//Calling shoes

Widget _buildCallingShoes(context) {
  final CustomSize size = CustomSize(context);
  return ListCardsWidget(size: size);
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
