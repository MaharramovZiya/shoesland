import 'package:flutter/material.dart';

class CustomValidator {
  final String? value;

  CustomValidator({required this.value});

  String? get emailEmptyCheck {
    if (value == null || value!.isEmpty) {
      return "Email field cannot be empty. Please enter your email address.";
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value.toString())) {
      return 'Please enter a valid email address.';
    }
    return null;
  }
  String? get passwordEmptyCheck{
       if (value == null || value!.isEmpty) {
      return 'Password field cannot be empty. Please enter your password.';
    } else if (value!.length < 6) {
      return 'Your password must be at least 6 characters long.';
    }
    return null;
  }

  String? get usernameEmptyCheck{
     if (value == null || value!.isEmpty) {
      return 'Username field cannot be empty. Please enter your username.';
    } else if (value!.length < 3) {
      return 'Your username must be at least 3 characters long.';
    }
    return null;
  }
  // String? get emptyCheck {
  //   if (value == null || value!.isEmpty) {
  //     return "Please enter some text";
  //   }
  //   return null;
  // }

  //For email empty check
  // String? emailValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Email field cannot be empty. Please enter your email address.';
  //   } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
  //     return 'Please enter a valid email address.';
  //   }
  //   return null;
  // }

  // String? passwordValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Password field cannot be empty. Please enter your password.';
  //   } else if (value.length < 6) {
  //     return 'Your password must be at least 6 characters long.';
  //   }
  //   return null;
  // }

  // String? _usernameValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Username field cannot be empty. Please enter your username.';
  //   } else if (value.length < 3) {
  //     return 'Your username must be at least 3 characters long.';
  //   }
  //   return null;
  // }
}
