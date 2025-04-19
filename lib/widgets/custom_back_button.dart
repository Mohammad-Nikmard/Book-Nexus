import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CustomBackIcon extends StatelessWidget {
  const CustomBackIcon({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Row(
        children: AnimationConfiguration.toStaggeredList(
          childAnimationBuilder: (widget) {
            return SlideAnimation(
              horizontalOffset: -150,
              duration: const Duration(milliseconds: 1500),
              child: FadeInAnimation(
                child: widget,
              ),
            );
          },
          children: [
            Assets.svg.arrowLeft.svg(
              height: 24,
              width: 24,
            ),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                fontFamily: 'NM',
                fontSize: 16,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
