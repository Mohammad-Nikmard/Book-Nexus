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
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              CustomDividerHeader(
                header: 'My Library',
                boxWidth: 130,
              ),
              SizedBox(height: 24),
              _LirbraryTagList(),
              const SizedBox(height: 24),
              _InProgressListSection(),
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

class _LirbraryTagList extends StatelessWidget {
  const _LirbraryTagList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.only(right: 8),
            child: _LibraryPageTag(
              tag: 'In Progress',
              image: 'icon_headphone',
            ),
          );
        },
      ),
    );
  }
}

class _InProgressListSection extends StatelessWidget {
  const _InProgressListSection();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 230,
      width: double.infinity,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 405,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (context, index) {
          return const _LibraryBookCover(
            image: 'The Good Guy Cover',
            title: 'The good guy',
            author: 'Mark mcallister',
            subTitle: 'A story about guy who was very good until the end when',
            isInProgress: false,
            audioLength: '8m',
            bookLength: '8m',
          );
        },
      ),
    );
  }
}

class _LibraryBookCover extends StatelessWidget {
  const _LibraryBookCover({
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
          Image.asset(
            'assets/images/$image.png',
            height: 254,
            width: double.infinity,
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
                height: 43,
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
                                      SvgPicture.asset(
                                        'assets/images/icon_headphone.svg',
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
                                      SvgPicture.asset(
                                        'assets/images/icon_glasses.svg',
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
