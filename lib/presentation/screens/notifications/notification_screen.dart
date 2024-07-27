
import 'package:flutter/material.dart';
import 'package:shoesland/presentation/screens/notifications/widgets/bulild_ui_widget.dart';

class NotificationScreen extends StatelessWidget {
const NotificationScreen({ super.key });

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: buildUINotifications(context)
    );
  }
}

