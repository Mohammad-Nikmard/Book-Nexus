import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/extensions/context_extension.dart';
import 'package:book_nexsus/gen/assets.gen.dart';
import 'package:book_nexsus/ui/product_detail_screen.dart';
import 'package:book_nexsus/widgets/custom_divider_header.dart';
import 'package:book_nexsus/widgets/mini_player.dart';
import 'package:book_nexsus/widgets/search_product_cover.dart';
import 'package:book_nexsus/widgets/tag_list_view.dart';
import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  int selectedIndex = 0;
  List<String> tagNames = [
    'Saved Books',
    'In Progress',
    'Completed',
  ];
  List<String> tagIcons = [
    'bookmark',
    'headphone',
    'check',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SafeArea(
            child: CustomScrollView(
              slivers: [
                const SliverPadding(
                  padding: EdgeInsets.only(top: 10, bottom: 24, left: 16),
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
                    child: TagListView(
                      iconList: tagIcons,
                      tagNameList: tagNames,
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
          const MiniPlayer(),
        ],
      ),
    );
  }
}

class _CompletedListSection extends StatelessWidget {
  const _CompletedListSection();

  @override
  Widget build(BuildContext context) {
    return _GridDecorator(
      child: SearchProductCover(
        image: Assets.images.callOfTheMazeCover.path,
        title: 'The good guy',
        author: 'Mark mcallister',
        subTitle: 'A story about guy who was very good until the end when',
        isInProgress: false,
        audioLength: '8m',
        bookLength: '8m',
      ),
    );
  }
}

class _InProgressListSection extends StatelessWidget {
  const _InProgressListSection();

  @override
  Widget build(BuildContext context) {
    return _GridDecorator(
      child: SearchProductCover(
        image: Assets.images.romanBookCover.path,
        title: 'The good guy',
        author: 'Mark mcallister',
        subTitle: 'A story about guy who was very good until the end when',
        isInProgress: false,
        audioLength: '8m',
        bookLength: '8m',
      ),
    );
  }
}

class _SavedBooksSection extends StatelessWidget {
  const _SavedBooksSection();

  @override
  Widget build(BuildContext context) {
    return _GridDecorator(
      child: SearchProductCover(
        image: Assets.images.duneBookCover.path,
        title: 'The good guy',
        author: 'Mark mcallister',
        subTitle: 'A story about guy who was very good until the end when',
        isInProgress: false,
        audioLength: '8m',
        bookLength: '8m',
      ),
    );
  }
}

class _GridDecorator extends StatelessWidget {
  const _GridDecorator({
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 84, left: 16, right: 16),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return GestureDetector(
              onTap: () => context.push(const ProductDetailScreen()),
              child: child,
            );
          },
          childCount: 3,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 415,
          mainAxisSpacing: 8,
          crossAxisSpacing: 14,
        ),
      ),
    );
  }
}
