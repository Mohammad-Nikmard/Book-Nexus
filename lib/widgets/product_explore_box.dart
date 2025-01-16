import 'package:book_nexsus/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
