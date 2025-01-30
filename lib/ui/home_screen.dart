import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/widgets/explore_topic_list.dart';
import 'package:book_nexsus/widgets/story_card.dart';
import 'package:book_nexsus/widgets/tag_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
    'icon_headphone',
    'icon_fire',
    'icon_book_open',
    'icon_fire',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() async {
      if (_scrollController.offset.round() < -40 && !onTapped) {
        await chnageStoryCardLogic();
      } else if (_scrollController.offset.round() > 5 && onTapped) {
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
            SvgPicture.asset(
              'assets/images/icon_indicator_curved.svg',
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.cyan,
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
                            delegate:
                                SliverChildBuilderDelegate((context, index) {
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
                            }, childCount: 10),
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
                ExploreTopicLists(
                  topicNames: topicNames,
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 0.5,
                    activeTrackColor: AppColors.greenAccent,
                    inactiveTrackColor: const Color(0xff1E211C),
                    overlayShape: SliderComponentShape.noOverlay,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 0,
                    ),
                  ),
                  child: Slider(
                    value: 0.5,
                    thumbColor: Colors.transparent,
                    inactiveColor: const Color(0xff232538),
                    onChanged: (value) {},
                  ),
                ),
                SizedBox(
                  height: 70,
                  width: double.infinity,
                  child: ColoredBox(
                    color: const Color(0xff1E211C),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 54,
                            width: 38,
                            child: Image.asset(
                              'assets/images/The Good Guy Cover.png',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Continue Listening',
                                  style: TextStyle(
                                    fontFamily: 'NM',
                                    fontSize: 14,
                                    color: AppColors.greenAccent,
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.55,
                                  child: const Text(
                                    'Managers who want to create positive work environments',
                                    style: TextStyle(
                                      fontFamily: 'NR',
                                      fontSize: 12,
                                      color: AppColors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Container(
                                height: 32,
                                width: 32,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.greenAccent,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: SvgPicture.asset(
                                    'assets/images/icon_play.svg',
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Container(
                                height: 32,
                                width: 32,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.greenAccent,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: SvgPicture.asset(
                                    'assets/images/icon_forward.svg',
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
