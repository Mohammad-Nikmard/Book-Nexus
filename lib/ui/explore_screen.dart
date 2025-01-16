import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/widgets/custom_divider_header.dart';
import 'package:book_nexsus/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late TextEditingController searchController;

  final List<String> topicNames = [
    'Personal growth',
    'Culture & Society',
    'Fiction',
    'Mind & Philosophy',
    'Health & Fitness',
    'Biographies',
    'Education',
    'History',
    'Future',
    'Technology',
    'Life style',
  ];

  @override
  void initState() {
    searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, bottom: 25, top: 8),
              child: CustomDividerHeader(
                header: 'Explore',
                boxWidth: 94,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height - 75,
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverToBoxAdapter(
                      child: CustomSearchField(
                        height: 45,
                        controller: searchController,
                        hintText: 'Title, author or keyword',
                        prefixIcon: SizedBox(
                          height: 24,
                          width: 24,
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/images/icon_search.svg',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: _ExploreTopicsSection(
                      topicNames: topicNames,
                    ),
                  ),
                  _ExploreTopicLists(
                    topicNames: topicNames,
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

class _ExploreTopicsSection extends StatelessWidget {
  const _ExploreTopicsSection({
    required this.topicNames,
  });
  final List<String> topicNames;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 22, top: 40, bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Topics',
            style: TextStyle(
              fontFamily: 'NB',
              fontSize: 20,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 8,
            runSpacing: 13,
            children: List.generate(
              topicNames.length,
              (index) => ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(8),
                ),
                child: SizedBox(
                  height: 30,
                  child: ColoredBox(
                    color: AppColors.greyDark,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            topicNames[index],
                            style: const TextStyle(
                              fontFamily: 'NR',
                              fontSize: 12,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ExploreTopicLists extends StatelessWidget {
  const _ExploreTopicLists({
    required this.topicNames,
  });
  final List<String> topicNames;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 24),
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
                        Text(
                          topicNames[index],
                          style: const TextStyle(
                            fontFamily: 'NB',
                            fontSize: 20,
                            color: AppColors.white,
                          ),
                        ),
                        Row(
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
                                padding:
                                    EdgeInsets.only(left: index == 0 ? 15 : 8),
                                child: const ProductExploreBox(),
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
        },
        childCount: topicNames.length,
      ),
    );
  }
}

class ProductExploreBox extends StatelessWidget {
  const ProductExploreBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 164,
            width: double.infinity,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                'assets/images/The Good Guy Cover.png',
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'The good guy',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'NM',
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'mark fellani',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'NR',
              fontSize: 10,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const SizedBox(width: 3),
              SvgPicture.asset(
                'assets/images/icon_headphone.svg',
                height: 14,
                width: 14,
              ),
              const SizedBox(width: 4),
              const Text(
                '5m',
                style: TextStyle(
                  fontFamily: 'NR',
                  fontSize: 10,
                  color: AppColors.greyLight,
                ),
              ),
              const SizedBox(width: 16),
              SvgPicture.asset(
                'assets/images/icon_glasses.svg',
                height: 14,
                width: 14,
              ),
              const SizedBox(width: 4),
              const Text(
                '5m',
                style: TextStyle(
                  fontFamily: 'NR',
                  fontSize: 10,
                  color: AppColors.greyLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
