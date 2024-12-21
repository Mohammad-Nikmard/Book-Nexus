import 'package:book_nexsus/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.suffixIcon,
    this.fillColor = AppColors.white,
    this.textColor = AppColors.black,
  });
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final Color fillColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: double.infinity,
      child: TextField(
        obscureText: obscureText,
        style: TextStyle(
          fontFamily: 'NR',
          fontSize: 16,
          color: textColor,
        ),
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: fillColor,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'NR',
            fontSize: 14,
            color: AppColors.greyLight,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),
      ),
    );
  }
}
