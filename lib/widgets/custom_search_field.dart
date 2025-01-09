import 'package:book_nexsus/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    super.key,
    required this.controller,
    this.prefixIcon,
    this.hintText,
    required this.height,
  });
  final TextEditingController controller;
  final Widget? prefixIcon;
  final String? hintText;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: TextField(
        style: const TextStyle(
          fontFamily: 'NR',
          fontSize: 14,
          color: AppColors.white,
        ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          filled: true,
          fillColor: AppColors.greyDark,
          hintText: hintText,
          hintStyle: const TextStyle(
            fontFamily: 'NR',
            fontSize: 14,
            color: AppColors.greyMed,
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.greyMed,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: AppColors.greenAccent,
            ),
          ),
        ),
      ),
    );
  }
}
