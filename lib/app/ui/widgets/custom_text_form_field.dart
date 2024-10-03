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
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(16.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        fillColor: const Color(0xFFD7E0DB),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFFB0B8B3),
          fontSize: 16.0,
          fontWeight: FontWeight.w500,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black,
          fontFamily: 'Lato',
          fontSize: 16.0,
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
        fontFamily: 'Lato',
        fontSize: 16.0,
      ),
      cursorColor: Colors.black,
      onChanged: onChanged,
    );
  }
}
