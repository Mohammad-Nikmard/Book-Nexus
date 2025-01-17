import 'package:book_nexsus/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomProductTagList extends StatelessWidget {
  const CustomProductTagList({
    super.key,
    required this.topicNames,
  });
  final List<String> topicNames;

  @override
  Widget build(BuildContext context) {
    return Wrap(
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
    );
  }
}
