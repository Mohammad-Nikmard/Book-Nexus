import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/widgets/custom_divider_header.dart';
import 'package:book_nexsus/widgets/search_product_cover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              const SliverPadding(
                padding: EdgeInsets.only(top: 10, bottom: 24),
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
                padding: const EdgeInsets.only(bottom: 24),
                sliver: SliverToBoxAdapter(
                  child: _LirbraryTagList(
                    selectedIndex: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
              ),
              Builder(
                builder: (context) {
                  if (selectedIndex == 0) {
                    return const _SavedBooksSection();
                  } else if (selectedIndex == 1) {
                    return const _InProgressListSection();
                  } else {
                    return const _CompletedListSection();
                  }
                },
              ),
            ],
          ),
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
  const _LirbraryTagList({required this.selectedIndex});
  final ValueChanged<int> selectedIndex;

  @override
  State<_LirbraryTagList> createState() => _LirbraryTagListState();
}

class _LirbraryTagListState extends State<_LirbraryTagList> {
  int selectedIndex = 0;
  List<String> tagNames = [
    'Saved Books',
    'In Progress',
    'Completed',
  ];
  List<String> tagIcons = [
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
                selectedIndex = index;

                widget.selectedIndex(index);
              },
              child: _LibraryPageTag(
                isTagTapped: selectedIndex == index,
                tag: tagNames[index],
                image: tagIcons[index],
              ),
            ),
          );
        },
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
          return const SearchProductCover(
            image: 'The Good Guy Cover',
            title: 'The good guy',
            author: 'Mark mcallister',
            subTitle: 'A story about guy who was very good until the end when',
            isInProgress: false,
            audioLength: '8m',
            bookLength: '8m',
          );
        },
        childCount: 10,
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

class _InProgressListSection extends StatelessWidget {
  const _InProgressListSection();

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const SearchProductCover(
            image: 'The Good Guy Cover',
            title: 'The good guy',
            author: 'Mark mcallister',
            subTitle: 'A story about guy who was very good until the end when',
            isInProgress: false,
            audioLength: '8m',
            bookLength: '8m',
          );
        },
        childCount: 5,
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

class _SavedBooksSection extends StatelessWidget {
  const _SavedBooksSection();

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return const SearchProductCover(
            image: 'The Good Guy Cover',
            title: 'The good guy',
            author: 'Mark mcallister',
            subTitle: 'A story about guy who was very good until the end when',
            isInProgress: false,
            audioLength: '8m',
            bookLength: '8m',
          );
        },
        childCount: 3,
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
