import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/gen/assets.gen.dart';
import 'package:flutter/material.dart';

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
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            child: SizedBox(
              height: 164,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(
                  Assets.images.romanBookCover.path,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Roman',
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
            'Olivia Willson',
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
              Assets.svg.headphone.svg(
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
              Assets.svg.glasses.svg(
                height: 14,
                width: 14,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
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
