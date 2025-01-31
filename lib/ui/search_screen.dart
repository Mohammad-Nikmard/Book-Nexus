import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController searchController;
  int recentSeachListLength = 4;

  final listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 24),
                child: CustomSearchField(
                  height: 52,
                  controller: searchController,
                  prefixIcon: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SizedBox(
                      height: 24,
                      width: 24,
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/images/icon_arrow_left.svg',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Clear recent searches',
                    style: TextStyle(
                      fontFamily: 'NB',
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    'Recent searches',
                    style: TextStyle(
                      fontFamily: 'NB',
                      fontSize: 12,
                      color: AppColors.greyMed,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: MediaQuery.of(context).size.height - 150,
                child: CustomScrollView(
                  slivers: [
                    SliverAnimatedList(
                      key: listKey,
                      itemBuilder: (context, index, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: _RecentSearchProduct(
                            isAlreadySearched: true,
                            onDeleteTapped: () {
                              setState(() {
                                recentSeachListLength--;
                              });
                              listKey.currentState?.removeItem(
                                index,
                                (context, animation) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: const _RecentSearchProduct(
                                      isAlreadySearched: true,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        );
                      },
                      initialItemCount: recentSeachListLength,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecentSearchProduct extends StatelessWidget {
  const _RecentSearchProduct({
    required this.isAlreadySearched,
    this.onDeleteTapped,
  });
  final bool isAlreadySearched;
  final VoidCallback? onDeleteTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 77,
            width: 53,
            child: Center(
              child: Image.asset(
                'assets/images/The Good Guy Cover.png',
              ),
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'The Good Guy',
                style: TextStyle(
                  fontFamily: 'NM',
                  fontSize: 14,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                'The Good Guy',
                style: TextStyle(
                  fontFamily: 'NR',
                  fontSize: 12,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/icon_headphone.svg',
                  ),
                  const SizedBox(height: 2),
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
                  ),
                  const SizedBox(height: 2),
                  const Text(
                    '8m',
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
          const Spacer(),
          Visibility(
            visible: isAlreadySearched,
            child: GestureDetector(
              onTap: () {
                onDeleteTapped!();
              },
              child: SvgPicture.asset(
                'assets/images/icon_delete.svg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
