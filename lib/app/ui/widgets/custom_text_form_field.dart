import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool? obscureText;
  final void Function()? suffixIconOnPressed;
  final void Function(String)? onChanged;
  final bool? readOnly;

  const CustomTextFormField({
    required this.controller,
    this.labelText,
    this.hintText,
    this.obscureText,
    this.suffixIconOnPressed,
    this.onChanged,
    this.readOnly,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText ?? false,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        labelText: labelText,
      ),
      style: const TextStyle(fontSize: 16.0, color: Colors.black),
      cursorColor: Colors.black,
      onChanged: onChanged,
    );
  }
}
