import 'dart:ui';

import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/ui/product_listing_screen.dart';
import 'package:book_nexsus/util/app_navigator.dart';
import 'package:book_nexsus/widgets/custom_product_tag_list.dart';
import 'package:book_nexsus/widgets/product_explore_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                const _BackgroundPhoto(),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 110, bottom: 24),
                          child: _BookCover(),
                        ),
                        _ProductHeader(),
                        _ChapterSection(),
                        _AuthorBox(),
                        _SimilarBooksSection(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BackgroundPhoto extends StatelessWidget {
  const _BackgroundPhoto();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Image.asset(
                'assets/images/The Good Guy Cover.png',
              ),
            ),
          ),
        ),
        Positioned(
          bottom: -190,
          child: Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: AppColors.background,
              gradient: LinearGradient(
                colors: [
                  AppColors.background,
                  AppColors.background,
                  AppColors.background,
                  Colors.transparent,
                ],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BookCover extends StatelessWidget {
  const _BookCover();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        SizedBox(
          height: 220,
          width: 153,
          child: FittedBox(
            fit: BoxFit.cover,
            child: Image.asset(
              'assets/images/The Good Guy Cover.png',
            ),
          ),
        ),
        _DoubleNoticeBox(
          leftContent: Row(
            children: [
              SvgPicture.asset(
                'assets/images/icon_book.svg',
              ),
              const SizedBox(width: 9),
              const Text(
                'Read Nexus',
                style: TextStyle(
                  fontFamily: 'NB',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          rightContent: Row(
            children: [
              SvgPicture.asset(
                'assets/images/icon_headphone_outlined.svg',
              ),
              const SizedBox(width: 9),
              const Text(
                'Play Nexus',
                style: TextStyle(
                  fontFamily: 'NB',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          size: 52,
        ),
      ],
    );
  }
}

class _DoubleNoticeBox extends StatelessWidget {
  const _DoubleNoticeBox({
    required this.leftContent,
    required this.rightContent,
    required this.size,
  });
  final Widget leftContent;
  final Widget rightContent;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.blueBG,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          leftContent,
          Padding(
            padding: EdgeInsets.symmetric(vertical: size < 40 ? 10 : 20),
            child: const VerticalDivider(
              thickness: 1,
              color: AppColors.greyLight,
            ),
          ),
          rightContent,
        ],
      ),
    );
  }
}

class _ProductHeader extends StatelessWidget {
  const _ProductHeader();

  @override
  Widget build(BuildContext context) {
    List<String> productTags = [
      'Personal growth',
      'Culture & Society',
      'Fiction',
      'Ming & Philosophy',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Flexible(
              child: Text(
                'Project Management for the Unofficial Project Manager',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'NB',
                ),
              ),
            ),
            SvgPicture.asset(
              'assets/images/icon_bookmark.svg',
              height: 20,
              width: 20,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'Kory Kogon, Suzette Blakemore, and James wood ',
                style: TextStyle(
                  fontFamily: 'NB',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: 'A FanklinConvey Title',
                style: TextStyle(
                  fontFamily: 'NR',
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        _DoubleNoticeBox(
          leftContent: SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/icon_clock.svg',
                ),
                const SizedBox(width: 9),
                const Text(
                  '18 min',
                  style: TextStyle(
                    fontFamily: 'NB',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          rightContent: SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/images/icon_light_bulb.svg',
                ),
                const SizedBox(width: 9),
                const Text(
                  'Key ideas',
                  style: TextStyle(
                    fontFamily: 'NB',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          size: 36,
        ),
        const SizedBox(height: 32),
        const Text(
          'About this Book',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontFamily: 'NB',
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Getting Along (2022) describes the importance of workplace interactions and thier effects on productivity and creativity',
          style: TextStyle(
            fontFamily: 'NR',
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        CustomProductTagList(
          topicNames: productTags,
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _ChapterSection extends StatelessWidget {
  const _ChapterSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '56 Chapter',
          style: TextStyle(
            fontFamily: 'NB',
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 24),
        _ChapterBox(
          isUnlocked: true,
          title: 'Intoduction',
          subtitle: 'Subscribe to unlock all 2 key ideas from',
          chapterNumber: '01',
        ),
        SizedBox(height: 24),
        _ChapterBox(
          isUnlocked: false,
          title: 'Creating The',
          subtitle: 'Subscribe to unlock all 2 key ideas from',
          chapterNumber: '02',
        ),
        SizedBox(height: 24),
        _ChapterBox(
          isUnlocked: false,
          title: 'Creating The',
          subtitle: 'Subscribe to unlock all 2 key ideas from',
          chapterNumber: '03',
        ),
        SizedBox(height: 24),
        _ChapterBox(
          isFinalSummary: true,
          isUnlocked: false,
          title: 'Final Summary',
          subtitle: '',
          chapterNumber: '',
        ),
        SizedBox(height: 24),
      ],
    );
  }
}

class _ChapterBox extends StatelessWidget {
  const _ChapterBox({
    required this.isUnlocked,
    required this.title,
    required this.subtitle,
    required this.chapterNumber,
    this.isFinalSummary = false,
  });
  final bool isUnlocked;
  final String title;
  final String subtitle;
  final String chapterNumber;
  final bool isFinalSummary;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: isFinalSummary
          ? null
          : Text(
              chapterNumber,
              style: const TextStyle(
                fontFamily: 'NR',
                fontSize: 14,
                color: Colors.white,
              ),
            ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'NB',
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      subtitle: isFinalSummary
          ? null
          : Text(
              subtitle,
              style: const TextStyle(
                fontFamily: 'NR',
                fontSize: 14,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            ),
      trailing: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isUnlocked ? AppColors.greenAccent : AppColors.blueBG,
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: SvgPicture.asset(
            isUnlocked
                ? 'assets/images/icon_play.svg'
                : 'assets/images/icon_lock.svg',
          ),
        ),
      ),
    );
  }
}

class _AuthorBox extends StatelessWidget {
  const _AuthorBox();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(12),
      ),
      child: SizedBox(
        height: 97,
        width: double.infinity,
        child: ColoredBox(
          color: AppColors.blueBG,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.red,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'James Wood',
                      style: TextStyle(
                        fontFamily: 'NB',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Text(
                      'A FanklinConvey Title',
                      style: TextStyle(
                        fontFamily: 'NR',
                        fontSize: 12,
                        color: Colors.white,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Flexible(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width - 150,
                        child: const Text(
                          'Managers who want to create positive work environments',
                          style: TextStyle(
                            fontFamily: 'NR',
                            fontSize: 12,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SimilarBooksSection extends StatelessWidget {
  const _SimilarBooksSection();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50, top: 32),
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Similar Books',
                    style: TextStyle(
                      fontFamily: 'NB',
                      fontSize: 20,
                      color: AppColors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductListingScreen(
                            name: 'Similar Books',
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Text(
                          'show all',
                          style: TextStyle(
                            fontFamily: 'NB',
                            fontSize: 12,
                            color: AppColors.greenAccent,
                          ),
                        ),
                        const SizedBox(width: 3),
                        SvgPicture.asset(
                          'assets/images/icon_arrow_circle_right.svg',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 254,
              width: double.infinity,
              child: CustomScrollView(
                scrollDirection: Axis.horizontal,
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: index == 0 ? 15 : 8),
                          child: GestureDetector(
                            onTap: () => AppNavigator.navigatePush(
                              context,
                              const ProductDetailScreen(),
                            ),
                            child: const ProductExploreBox(),
                          ),
                        );
                      },
                      childCount: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
