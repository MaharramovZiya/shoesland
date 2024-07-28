import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/logic/cubits/notification_cubit.dart';
import 'package:shoesland/presentation/screens/components/navigate_top_menu_tree.dart';
import 'package:shoesland/presentation/screens/notifications/widgets/notification_cart.dart';

Widget buildUINotifications(BuildContext context) {
  return SafeArea(
      child: Padding(
    padding: AppPadding.pageWithPadding,
    child: SingleChildScrollView(
      child: Column(
        children: [
          //Navigate top menu
          buildNotifactionNavigateTopMenu(
            () => context.read<NotificationProductCubit>().clearProducts(),
          ),

          //_buildUICarts
          _buildUICarts(context)
        ],
      ),
    ),
  ));
}

Widget _buildUICarts(context) {
  CustomSize customSize = CustomSize(context);
  return Container(
    padding: const EdgeInsets.only(top: 40),
    width: customSize.width,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTodayNotifications(context),
        _buildYesterdayNotifications(context)
      ],
    ),
  );
}

Widget _buildTodayNotifications(context) {
  CustomSize customSize = CustomSize(context);
  final Random random = Random();

  return BlocBuilder<NotificationProductCubit, NotifProductState>(
    builder: (context, state) {
      if (state is NotifProductLoaded) {
        final lastTwoProducts = state.products.length > 2
            ? state.products.sublist(state.products.length - 2)
            : state.products;
        return NotificationCartWidget(
            title: "Today",
            time: "min",
            lastTwoProducts: lastTwoProducts,
            random: random,
            customSize: customSize);
      }
      return Container();
    },
  );
}

Widget _buildYesterdayNotifications(context) {
  CustomSize customSize = CustomSize(context);
  final Random random = Random();
  return BlocBuilder<NotificationProductCubit, NotifProductState>(
    builder: (context, state) {
      if (state is NotifProductLoaded) {
        final lastTwoProducts = state.products.length > 2
            ? state.products.sublist(state.products.length - 4)
            : state.products;
        return NotificationCartWidget(
            title: "Yesterday",
            time: "day",
            lastTwoProducts: lastTwoProducts,
            random: random,
            customSize: customSize);
      }
      return Container();
    },
  );
}
