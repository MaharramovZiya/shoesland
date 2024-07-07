
import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/custom_size.dart';
import 'package:shoesland/core/constants/local_images.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class SignInWithGoogle extends StatelessWidget {
  const SignInWithGoogle({
    super.key,
     this.customSize,
  });

  final CustomSize? customSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colours.white,
          ),
          width: customSize?.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                LocalImages.google,
                width: 35,
              ),
              const SizedBox(
                width: 5,
              ),
               GeneralTextWidget(
                "Sign in with google",
                textStyle:
                   const TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              )
            ],
          )),
    );
  }
}