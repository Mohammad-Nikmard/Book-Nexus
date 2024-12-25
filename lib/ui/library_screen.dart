import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/widgets/custom_divider_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 10),
              CustomDividerHeader(
                header: 'My Library',
                boxWidth: 130,
              ),
              const SizedBox(height: 24),
              _LibraryPageTag(
                tag: 'In Progress',
                image: 'icon_headphone',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LibraryPageTag extends StatefulWidget {
  const _LibraryPageTag({
    required this.tag,
    required this.image,
  });
  final String tag;
  final String image;

  @override
  State<_LibraryPageTag> createState() => _LibraryPageTagState();
}

class _LibraryPageTagState extends State<_LibraryPageTag> {
  bool onTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          onTapped = !onTapped;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
        height: 42,
        width: 145,
        decoration: BoxDecoration(
          color: onTapped ? AppColors.greenAccent : Colors.transparent,
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
                SvgPicture.asset(
                  'assets/images/${widget.image}.svg',
                  colorFilter: ColorFilter.mode(
                    onTapped ? AppColors.greyDark : AppColors.white,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  'In Progress',
                  style: TextStyle(
                    fontFamily: 'NM',
                    fontSize: 14,
                    color: onTapped ? AppColors.greyDark : AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
