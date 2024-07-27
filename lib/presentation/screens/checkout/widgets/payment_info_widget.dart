import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_images.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class CheckoutPaymentInformationWidget extends StatelessWidget {
  const CheckoutPaymentInformationWidget({
    super.key,
    required this.customSize,
  });

  final CustomSize customSize;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: customSize.width,
        padding: AppPadding.pageWithPadding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        height: 600,
        child: ListView(
          children: [
            GeneralTextWidget(LocalStrings().contactInfo,
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colours.blackLikeToColor)),
            ListTile(
              leading: const Icon(Icons.email),
              title: Text(LocalStrings().emailTxtExample),
              subtitle: Text(LocalStrings().email),
              trailing: const Icon(Icons.edit),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text(LocalStrings().phoneNum),
              subtitle: Text(LocalStrings().phone),
              trailing: const Icon(Icons.edit),
            ),
            GeneralTextWidget(LocalStrings().address,
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colours.blackLikeToColor)),
            Container(
              padding: const EdgeInsets.only(right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GeneralTextWidget(LocalStrings().addressShop,
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colours.greyColor)),
                  const Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: customSize.width,
              height: 150,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: const Image(
                image: AssetImage(
                  LocalImages.location_store,
                ),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GeneralTextWidget(LocalStrings().paymentMethod,
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colours.blackLikeToColor)),
            ListTile(
              leading: const Image(
                image: AssetImage(
                  LocalImages.paypal,
                ),
                width: 30,
              ),
              title: Text(LocalStrings().paypalCard),
              subtitle: Text(LocalStrings().paypalCode),
              trailing: const Icon(Icons.keyboard_arrow_down_rounded),
            ),
          ],
        ));
  }
}
