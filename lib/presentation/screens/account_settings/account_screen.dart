import 'package:flutter/material.dart';
import 'package:shoesland/presentation/screens/account_settings/widgets/account_ui.dart';

class AccountScreen extends StatelessWidget {
const AccountScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: buildUIAccount(context),
    );
  }
}