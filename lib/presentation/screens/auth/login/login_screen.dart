import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoesland/core/constants/local_strings.dart';
import 'package:shoesland/core/utils/app_padding.dart';
import 'package:shoesland/presentation/routes/routes.dart';
import 'package:shoesland/presentation/screens/auth/widgets/auth_controller.dart';
import 'package:shoesland/presentation/screens/auth/widgets/auth_custom_title.dart';
import 'package:shoesland/presentation/screens/auth/widgets/custom_form_field.dart';
import 'package:shoesland/presentation/screens/auth/widgets/sign_in_with_google.dart';
import 'package:shoesland/presentation/screens/components/custom_form_mixin.dart';
import 'package:shoesland/presentation/screens/components/custom_validator.dart';
import 'package:shoesland/presentation/widgets/custom_button.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with FormFieldMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
        padding: AppPadding.pageWithPadding,
        child: SingleChildScrollView(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          primary: false,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          dragStartBehavior: DragStartBehavior.start,
          child: Form(
            key: customFormLoginKey,
            onChanged: onFormChange,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child:  AuthCustomTitle(
                    title: LocalStrings().loginTitle,
                    subtitle: LocalStrings().logSubTitle,
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                GeneralTextWidget(
                  LocalStrings().email,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
                CustomFormField(
                  hintText: LocalStrings().emailHint,
                  validator: (value) =>
                      CustomValidator(value: value).emailEmptyCheck,
                ),
                const SizedBox(
                  height: 35,
                ),
                GeneralTextWidget(
                  LocalStrings().password,
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 16),
                ),
                CustomFormField(
                  hintText: LocalStrings().passwordHint,
                  validator: (value) =>
                      CustomValidator(value: value).passwordEmptyCheck,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: GeneralTextWidget(
                        LocalStrings().recoverpassword,
                        textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      )),
                ),
                const SizedBox(height: 16),
                CustomValidBtn(
                    formValidateNotifier: formValidateNotifier,
                    text: LocalStrings().signIn),
                const SizedBox(height: 16),
                const SignInWithGoogle(),
                const SizedBox(height: 16),
                AccountController(
                    promptText: LocalStrings().accountControl,
                    actionText: LocalStrings().signUpForFree,
                    onActionPressed: () {
                      Get.toNamed(Routes.register);
                    }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
