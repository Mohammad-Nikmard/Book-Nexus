import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/extensions/context_extension.dart';
import 'package:book_nexsus/gen/assets.gen.dart';
import 'package:book_nexsus/ui/dashboard_screen.dart';
import 'package:book_nexsus/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GenrePreferencesScreen extends StatelessWidget {
  const GenrePreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: AnimationLimiter(
                  child: Row(
                    children: AnimationConfiguration.toStaggeredList(
                      childAnimationBuilder: (widget) {
                        return SlideAnimation(
                          horizontalOffset: -300.0,
                          duration: const Duration(milliseconds: 1500),
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        );
                      },
                      children: [
                        const Text(
                          'Select Genres',
                          style: TextStyle(
                            fontFamily: 'NB',
                            fontSize: 32,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ColoredBox(
                    color: AppColors.greyDark,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 24,
                        horizontal: 16,
                      ),
                      child: _GenreBoxContent(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GenreBoxContent extends StatelessWidget {
  _GenreBoxContent();

  final List<String> genreList = [
    'Fiction',
    'Novel',
    'Narrative',
    'Historical Fiction',
    'Non-fiction',
    'Mystery',
    'Horror',
    "Children's Literature",
    'Thriller',
    'Sci-Fi',
    'Roamntic',
    'History',
    'Poetry',
    'Biography',
    'Crime',
    'Autobiography',
    'Cookbook',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select the type of book you enjoy reading.',
          style: TextStyle(
            fontFamily: 'NR',
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: List<Widget>.generate(
              genreList.length,
              (index) => _GenreSelectionBox(
                text: genreList[index],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Center(
          child: Text(
            'Show more',
            style: TextStyle(
              fontFamily: 'NB',
              fontSize: 14,
              color: AppColors.greenAccent,
            ),
          ),
        ),
        const SizedBox(height: 24),
        CustomElevatedButton(
          onPressed: () => context.pushReplacement(const DashboardScreen()),
          text: 'Continue',
        ),
        const SizedBox(height: 12),
        const Center(
          child: Text(
            'Select 3 or more genres to continue',
            style: TextStyle(
              fontFamily: 'NR',
              fontSize: 14,
              color: AppColors.greyLight,
            ),
          ),
        ),
      ],
    );
  }
}

class _GenreSelectionBox extends StatefulWidget {
  const _GenreSelectionBox({
    required this.text,
  });
  final String text;

  @override
  State<_GenreSelectionBox> createState() => _GenreSelectionBoxState();
}

class _GenreSelectionBoxState extends State<_GenreSelectionBox> {
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
        height: 42,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: onTapped ? Colors.transparent : AppColors.background,
          ),
          color: onTapped ? AppColors.greenAccent : Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        duration: const Duration(milliseconds: 400),
        curve: Curves.decelerate,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedDefaultTextStyle(
                style: TextStyle(
                  fontFamily: 'NM',
                  fontSize: 14,
                  color:
                      onTapped ? AppColors.background : const Color(0xffC4CCCC),
                ),
                duration: const Duration(milliseconds: 400),
                curve: Curves.decelerate,
                child: Text(widget.text),
              ),
              const SizedBox(width: 5),
              AnimatedCrossFade(
                firstChild: Assets.svg.circlePlus.svg(
                  height: 24,
                  width: 24,
                ),
                secondChild: Assets.svg.check.svg(
                  colorFilter: const ColorFilter.mode(
                    AppColors.background,
                    BlendMode.srcIn,
                  ),
                  height: 24,
                  width: 24,
                ),
                crossFadeState: onTapped
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(microseconds: 400),
                firstCurve: Curves.decelerate,
                secondCurve: Curves.decelerate,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
