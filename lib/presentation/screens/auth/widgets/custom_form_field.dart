import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final bool isEmail;
  final bool isUsername;
  final IconData? suffixIcon;
  final IconData? prefixIcon;
  final VoidCallback? onPrefixIconPressed;
  final VoidCallback? onSuffixIconPressed;
  final TextEditingController? controller;
  final String? errorText;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final String? Function(String?)? validator;

  const CustomFormField({
    Key? key,
    required this.hintText,
    this.onChanged,
    this.isPassword = false,
    this.validator,
    this.isEmail = false,
    this.isUsername = false,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.errorText,
    this.controller,
    this.obscureText = false,
    this.prefixIcon,
    this.onPrefixIconPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      cursorColor: Colors.black,
      obscureText: obscureText,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      onChanged: onChanged,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? IconButton(onPressed: onPrefixIconPressed, icon: Icon(prefixIcon))
            : null,
        fillColor: Colors.white,
        filled: true,
        errorText: errorText,
        hintText: hintText,
        suffixIcon: suffixIcon != null
            ? IconButton(
                icon: Icon(suffixIcon),
                onPressed: onSuffixIconPressed,
              )
            : null,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
