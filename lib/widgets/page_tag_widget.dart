import 'package:book_nexsus/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PageTagWidget extends StatelessWidget {
  const PageTagWidget({
    super.key,
    required this.tag,
    required this.image,
    required this.isTagTapped,
  });
  final String tag;
  final String image;
  final bool isTagTapped;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.decelerate,
      height: 42,
      decoration: BoxDecoration(
        color: isTagTapped ? AppColors.greenAccent : Colors.transparent,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        border: Border.all(
          width: 1,
          color: AppColors.greyDark,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/$image.svg',
                    colorFilter: ColorFilter.mode(
                      isTagTapped ? AppColors.greyDark : AppColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                tag,
                style: TextStyle(
                  fontFamily: 'NM',
                  fontSize: 14,
                  color: isTagTapped ? AppColors.greyDark : AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
