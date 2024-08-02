import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/colours.dart';
import 'package:shoesland/core/constants/local_images.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/presentation/screens/components/navigate_top_menu_tree.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: AppPadding.pageWithPadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildProfileNavigateTopMenu(context),
            const SizedBox(
              height: 25,
            ),
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(LocalImages.user),
            ),
            const SizedBox(
              height: 25,
            ),
            GeneralTextWidget("Alisson Becker",
                textStyle: const TextStyle(
                    color: Colours.blackLikeToColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
            const Align(
              child: Form(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileFieldTitle(
                    text: "Full Name",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FullNameField(),
                  SizedBox(
                    height: 20,
                  ),
                  ProfileFieldTitle(
                    text: "Email Adress",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  EmailField(),
                  SizedBox(
                    height: 20,
                  ),
                  ProfileFieldTitle(
                    text: "Password",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  PasswordField(),
                ],
              )),
            )
          ],
        ),
      ),
    )));
  }
}

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      enabled: false,
      decoration: InputDecoration(
          hintText: "alossonbecker@gmail.com",
          border: OutlineInputBorder(),

          // ignore: prefer_const_constructors
          hintStyle: TextStyle(fontSize: 13)),
    );
  }
}

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      enabled: false,
      obscureText: true,
      decoration: InputDecoration(
          hintText: "******",
          border: OutlineInputBorder(),
          // ignore: prefer_const_constructors
          hintStyle: TextStyle(fontSize: 13)),
    );
  }
}

class ProfileFieldTitle extends StatelessWidget {
  const ProfileFieldTitle({
    required this.text,
    super.key,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return GeneralTextWidget(text,
        textStyle: const TextStyle(
            color: Colours.blackLikeToColor,
            fontSize: 17,
            fontWeight: FontWeight.w500));
  }
}

class FullNameField extends StatelessWidget {
  const FullNameField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TextField(
      enabled: false,
      decoration: InputDecoration(
          hintText: "Alosson Becker",
          border: OutlineInputBorder(),

          // ignore: prefer_const_constructors
          hintStyle: TextStyle(fontSize: 13)),
    );
  }
}
