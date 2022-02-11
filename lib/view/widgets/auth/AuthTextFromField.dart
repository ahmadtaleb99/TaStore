import 'package:flutter/material.dart';

class AuthTextFromField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffexIcon;
  final String hintText;
  final Function validator;
  const AuthTextFromField(
      {Key? key,
      required this.controller,
      required this.obscureText,
      this.prefixIcon,
      required this.hintText,
      required this.validator, this.suffexIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      validator: (value) => validator(value),
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: suffexIcon,
        fillColor: Colors.grey.shade200,
        prefixIcon: prefixIcon,
        filled: true,
        hintText: hintText,
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
