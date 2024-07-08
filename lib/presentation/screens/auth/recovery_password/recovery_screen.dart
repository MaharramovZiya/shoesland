import 'package:flutter/material.dart';
import 'package:shoesland/core/constants/local_strings.dart';

import 'package:shoesland/presentation/screens/auth/widgets/auth_custom_title.dart';
import 'package:shoesland/presentation/screens/auth/widgets/custom_form_field.dart';
import 'package:shoesland/presentation/widgets/custom_button.dart';
import 'package:shoesland/presentation/widgets/general_txt_widget.dart';

class RecoveryScreen extends StatelessWidget {
  const RecoveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.00),
          child: Center(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: AuthCustomTitle(
                    title: LocalStrings().recoveryTitle,
                    subtitle: LocalStrings().recoverySubTitle,
                  ),
                ),
                const SizedBox(
                  height: 45,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: GeneralTextWidget(
                    LocalStrings().email,
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w400, fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomFormField(
                  hintText: LocalStrings().emailHint,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                    text: LocalStrings().continueTxt, onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
