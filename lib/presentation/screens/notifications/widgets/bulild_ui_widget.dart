import 'package:flutter/material.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/presentation/screens/components/navigate_top_menu_tree.dart';

Widget buildUINotifications(BuildContext context) {
  return SafeArea(
      child: Padding(
    padding: AppPadding.pageWithPadding,
    child: SingleChildScrollView(
      child: Column(



        children: [
          //Navigate top menu
          buildNotifactionNavigateTopMenu()

          //
          
          
          
          ],
      ),
    ),
  ));
}
