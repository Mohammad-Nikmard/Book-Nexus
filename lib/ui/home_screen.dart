import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/extensions/context_extension.dart';
import 'package:book_nexsus/gen/assets.gen.dart';
import 'package:book_nexsus/ui/account_screen.dart';
import 'package:book_nexsus/widgets/explore_topic_list.dart';
import 'package:book_nexsus/widgets/mini_player.dart';
import 'package:book_nexsus/widgets/story_card.dart';
import 'package:book_nexsus/widgets/tag_list_view.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  int selectedIndex = 0;
  bool onTapped = false;
  bool needToShowExpandedStory = false;
  bool needToShowContent = false;
  List<String> topicNames = [
    'For you',
    'Trending',
    '5-Minutes read',
    'Trending',
  ];

  List<String> tagIcons = [
    'headphone',
    'fire',
    'book_open',
    'fire',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() async {
      if (_scrollController.offset.round() < -80 && !onTapped) {
        await chnageStoryCardLogic();
      } else if (_scrollController.offset.round() > 25 && onTapped) {
        setState(() {
          needToShowContent = false;
        });
        await chnageStoryCardLogic();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> chnageStoryCardLogic() async {
    if (!needToShowExpandedStory) {
      setState(() {
        onTapped = true;
      });
      await Future.delayed(
        const Duration(milliseconds: 300),
        () {
          setState(() {
            needToShowExpandedStory = true;
          });
        },
      );

      await Future.delayed(
        const Duration(milliseconds: 200),
        () {
          setState(() {
            needToShowContent = true;
          });
        },
      );
    } else {
      await Future.delayed(
        const Duration(milliseconds: 500),
        () {
          setState(() {
            needToShowExpandedStory = false;
          });
        },
      );
      await Future.delayed(
        const Duration(milliseconds: 500),
        () {
          setState(() {
            onTapped = false;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Afternoon',
              style: TextStyle(
                fontFamily: 'NB',
                fontSize: 24,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 5),
            Assets.svg.indicatorCurved.svg(),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () => context.push(const AccountScreen()),
              child: const CircleAvatar(
                radius: 25,
                backgroundColor: Colors.cyan,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            CustomScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(top: 15),
                  sliver: SliverToBoxAdapter(
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.decelerate,
                      height: onTapped ? 212 : 100,
                      child: CustomScrollView(
                        scrollDirection: Axis.horizontal,
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: 10, left: index == 0 ? 16 : 0),
                                  child: StoryCard(
                                    needToShowContent: needToShowContent,
                                    onTapped: onTapped,
                                    needToShowExpandedStory:
                                        needToShowExpandedStory,
                                  ),
                                );
                              },
                              childCount: 3,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  sliver: SliverToBoxAdapter(
                    child: TagListView(
                      selectedIndex: (value) {
                        setState(() {
                          selectedIndex = value;
                        });
                      },
                      tagNameList: topicNames,
                      iconList: tagIcons,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: double.infinity,
                    margin:
                        const EdgeInsets.only(right: 16, left: 16, bottom: 20),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: AppColors.blueBG,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 130,
                            child: const Text(
                              'Get unlimited access to book in just',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontFamily: 'NB',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            '\$9.99',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'NB',
                              fontSize: 36,
                              color: AppColors.greenAccent,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'Terms & Conditions apply',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontFamily: 'NR',
                              fontSize: 10,
                              color: AppColors.greyLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.only(bottom: 40),
                  sliver: ExploreTopicLists(
                    topicNames: topicNames,
                  ),
                ),
              ],
            ),
            const MiniPlayer(),
          ],
        ),
      ),
    );
  }
}
