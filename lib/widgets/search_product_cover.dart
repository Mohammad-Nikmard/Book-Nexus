import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SearchProductCover extends StatelessWidget {
  const SearchProductCover({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.subTitle,
    this.audioLength,
    this.bookLength,
    required this.isInProgress,
    this.completionPercentage,
  });
  final String image;
  final String title;
  final String author;
  final String subTitle;
  final String? audioLength;
  final String? bookLength;
  final bool isInProgress;
  final String? completionPercentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
            child: SizedBox(
              height: 254,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(
                  image,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'NM',
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                author,
                style: const TextStyle(
                  fontFamily: 'NM',
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 40,
                child: Text(
                  subTitle,
                  style: const TextStyle(
                    fontFamily: 'NM',
                    fontSize: 12,
                    color: AppColors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(height: 8),
              isInProgress
                  ? Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          child: SizedBox(
                            height: 28,
                            child: ColoredBox(
                              color: AppColors.greenAccent,
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '$completionPercentage% completed',
                                        style: const TextStyle(
                                          fontFamily: 'NM',
                                          fontSize: 12,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          child: SizedBox(
                            height: 28,
                            child: ColoredBox(
                              color: AppColors.greenAccent,
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Assets.svg.headphone.svg(
                                        height: 16,
                                        width: 16,
                                        colorFilter: const ColorFilter.mode(
                                          AppColors.greyDark,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        audioLength!,
                                        style: const TextStyle(
                                          fontFamily: 'NM',
                                          fontSize: 12,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                          child: SizedBox(
                            height: 28,
                            child: ColoredBox(
                              color: AppColors.greyLight,
                              child: Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Assets.svg.glasses.svg(
                                        height: 16,
                                        width: 16,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        bookLength!,
                                        style: const TextStyle(
                                          fontFamily: 'NM',
                                          fontSize: 12,
                                          color: AppColors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
