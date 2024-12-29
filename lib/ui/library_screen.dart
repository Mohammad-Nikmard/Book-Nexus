import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/widgets/custom_divider_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int selectedTagIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverPadding(
              padding: EdgeInsets.only(top: 10, bottom: 24, left: 12),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    CustomDividerHeader(
                      header: 'My Library',
                      boxWidth: 130,
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 32),
              sliver: SliverToBoxAdapter(
                child: _LirbraryTagList(
                  listIndex: (value) {
                    setState(() {
                      selectedTagIndex = value;
                    });
                  },
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Stack(
                children: [
                  _CompletedListSection(),
                  _CompletedListSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _LibraryPageTag extends StatelessWidget {
  const _LibraryPageTag({
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
      width: 145,
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

class _LirbraryTagList extends StatefulWidget {
  const _LirbraryTagList({
    required this.listIndex,
  });
  final ValueChanged<int> listIndex;

  @override
  State<_LirbraryTagList> createState() => _LirbraryTagListState();
}

class _LirbraryTagListState extends State<_LirbraryTagList> {
  int selectedIndex = 0;
  List<String> tagTitle = [
    'Saved Books',
    'In Progress',
    'Completed',
  ];
  List<String> iconList = [
    'icon_bookmark',
    'icon_headphone',
    'icon_check',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: double.infinity,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 3,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;

                  widget.listIndex(selectedIndex);
                });
              },
              child: _LibraryPageTag(
                isTagTapped: selectedIndex == index,
                tag: tagTitle[index],
                image: iconList[index],
              ),
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
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 415,
        mainAxisSpacing: 8,
        crossAxisSpacing: 4,
      ),
    );
  }
}

class _SavedListSection extends StatelessWidget {
  const _SavedListSection();

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 415,
        mainAxisSpacing: 8,
        crossAxisSpacing: 4,
      ),
    );
  }
}

class _CompletedListSection extends StatelessWidget {
  const _CompletedListSection();

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
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
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 415,
        mainAxisSpacing: 8,
        crossAxisSpacing: 4,
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
          SizedBox(
            height: 254,
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/images/$image.png',
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
