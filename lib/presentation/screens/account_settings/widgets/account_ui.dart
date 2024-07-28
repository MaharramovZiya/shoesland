import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/presentation/screens/components/navigate_top_menu_tree.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

Widget buildUIAccount(BuildContext context) {
  return SafeArea(
      child: Padding(
    padding: AppPadding.pageWithPadding,
    child: SingleChildScrollView(
      child: Column(
        children: [
          //Navigate top menu
          buildAccountNavigateTopMenu(),

          // Account setting screen page design with listview
          _buildAccountUI(),
          const SizedBox(
            height: 25,
          ),
          _buildAppSetting()
        ],
      ),
    ),
  ));
}

Widget _buildAccountUI() {
  return ListView(
    padding: const EdgeInsets.only(top: 40),
    shrinkWrap: true,
    primary: false,
    children: [
      GeneralTextWidget(LocalStrings().account,
          textStyle: const TextStyle(
              color: Colours.blackLikeToColor,
              fontWeight: FontWeight.bold,
              fontSize: 18)),
      ListTile(
        leading: const Icon(
          Icons.notifications_active_outlined,
          size: 25,
          color: Colours.greyColor,
        ),
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_right_outlined)),
        title: GeneralTextWidget(LocalStrings().notificationSetting,
            textStyle: const TextStyle(
                color: Colours.greyColor,
                fontWeight: FontWeight.w500,
                fontSize: 16)),
      ),
      ListTile(
        leading: const Icon(
          Icons.shopping_cart,
          size: 25,
          color: Colours.greyColor,
        ),
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_right_outlined)),
        title: GeneralTextWidget(LocalStrings().shippingAddress,
            textStyle: const TextStyle(
                color: Colours.greyColor,
                fontWeight: FontWeight.w500,
                fontSize: 16)),
      ),
      ListTile(
        leading: const Icon(
          Icons.payments_sharp,
          size: 25,
          color: Colours.greyColor,
        ),
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_right_outlined)),
        title: GeneralTextWidget(LocalStrings().paymentInfo,
            textStyle: const TextStyle(
                color: Colours.greyColor,
                fontWeight: FontWeight.w500,
                fontSize: 16)),
      ),
      ListTile(
        leading: const Icon(
          Icons.delete_rounded,
          size: 25,
          color: Colours.greyColor,
        ),
        trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_right_outlined)),
        title: GeneralTextWidget(LocalStrings().deleteAccount,
            textStyle: const TextStyle(
                color: Colours.greyColor,
                fontWeight: FontWeight.w500,
                fontSize: 16)),
      )
    ],
  );
}

Widget _buildAppSetting() {
  return ListView(
    padding: const EdgeInsets.only(top: 40),
    shrinkWrap: true,
    primary: false,
    children: [
      GeneralTextWidget(LocalStrings().settings,
          textStyle: const TextStyle(
              color: Colours.blackLikeToColor,
              fontWeight: FontWeight.bold,
              fontSize: 18)),
      ListTile(
        title: GeneralTextWidget(LocalStrings().enableFace,
            textStyle: const TextStyle(
                color: Colours.greyColor,
                fontWeight: FontWeight.w500,
                fontSize: 16)),
        trailing: Switch(
          activeColor: Colours.blueColor,
          value: true,
          onChanged: (value) {},
        ),
      ),
      ListTile(
        trailing: Switch(
          activeColor: Colours.blueColor,
          value: false,
          onChanged: (value) {},
        ),
        title: GeneralTextWidget(LocalStrings().enablePushNotification,
            textStyle: const TextStyle(
                color: Colours.greyColor,
                fontWeight: FontWeight.w500,
                fontSize: 16)),
      ),
      ListTile(
        trailing: Switch(
          activeColor: Colours.blueColor,
          value: true,
          onChanged: (value) {},
        ),
        title: GeneralTextWidget(LocalStrings().enableLocation,
            textStyle: const TextStyle(
                color: Colours.greyColor,
                fontWeight: FontWeight.w500,
                fontSize: 16)),
      ),
      ListTile(
        trailing: Switch(
          activeColor: Colours.blueColor,
          value: false,
          onChanged: (value) {},
        ),
        title: GeneralTextWidget(LocalStrings().darkMode,
            textStyle: const TextStyle(
                color: Colours.greyColor,
                fontWeight: FontWeight.w500,
                fontSize: 16)),
      )
    ],
  );
}
