import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/presentation/screens/components/navigate_top_menu_tree.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

Widget buildUINotifications(BuildContext context) {
  return SafeArea(
      child: Padding(
    padding: AppPadding.pageWithPadding,
    child: SingleChildScrollView(
      child: Column(
        children: [
          //Navigate top menu
          buildNotifactionNavigateTopMenu(),

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
        SizedBox(
          child: Column(
            children: [
              GeneralTextWidget("Today",
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20))
            ],
          ),
        )
      ],
    ),
  );
}
