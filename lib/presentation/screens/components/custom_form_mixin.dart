import 'package:flutter/material.dart';


// Mixin definition
mixin FormFieldMixin<T extends StatefulWidget> on State<T> {
  // Login form key
  GlobalKey<FormState> customFormLoginKey = GlobalKey<FormState>();

  // Form validation notifier
  final ValueNotifier<bool> formValidateNotifier = ValueNotifier<bool>(false);

  // Form change notifier to validate the form
  void onFormChange() {
    formValidateNotifier.value = customFormLoginKey.currentState?.validate() ?? false;
  }
}

