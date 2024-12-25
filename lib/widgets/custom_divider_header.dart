import 'package:book_nexsus/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomDividerHeader extends StatelessWidget {
  const CustomDividerHeader({
    super.key,
    required this.header,
    required this.boxWidth,
  });
  final String header;
  final double boxWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: boxWidth,
      child: Column(
        children: [
          Text(
            header,
            style: const TextStyle(
              fontFamily: 'NB',
              fontSize: 24,
              color: AppColors.white,
            ),
          ),
          const Divider(
            thickness: 1,
            color: AppColors.greenAccent,
            height: 4.0,
          ),
        ],
      ),
    );
  }
}
