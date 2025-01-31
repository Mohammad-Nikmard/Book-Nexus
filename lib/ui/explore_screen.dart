import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/ui/search_screen.dart';
import 'package:book_nexsus/util/app_navigator.dart';
import 'package:book_nexsus/widgets/custom_divider_header.dart';
import 'package:book_nexsus/widgets/custom_product_tag_list.dart';
import 'package:book_nexsus/widgets/custom_search_field.dart';
import 'package:book_nexsus/widgets/explore_topic_list.dart';
import 'package:book_nexsus/widgets/mini_player.dart';
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
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SafeArea(
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
                  height: MediaQuery.of(context).size.height - 142,
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        sliver: SliverToBoxAdapter(
                          child: GestureDetector(
                            onTap: () => AppNavigator.navigatePush(
                              context,
                              const SearchScreen(),
                            ),
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
                      ),
                      SliverToBoxAdapter(
                        child: _ExploreTopicsSection(
                          topicNames: topicNames,
                        ),
                      ),
                      ExploreTopicLists(
                        topicNames: topicNames,
                      ),
                    ],
                  ),
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
          CustomProductTagList(
            topicNames: topicNames,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
