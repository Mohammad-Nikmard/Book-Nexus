import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/widgets/search_product_cover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0.0,
            backgroundColor: AppColors.background,
            pinned: true,
            expandedHeight: 190,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 1.8,
              title: Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontFamily: 'NM',
                ),
              ),
            ),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SizedBox(
                height: 20,
                width: 20,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(
                    'assets/images/icon_arrow_left.svg',
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return const SearchProductCover(
                    image: 'The Good Guy Cover',
                    title: 'The Good Guy',
                    author: 'Felani',
                    subTitle: 'this is a test',
                    isInProgress: false,
                    bookLength: '10m',
                    audioLength: '10m',
                  );
                },
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                mainAxisExtent: 410,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
