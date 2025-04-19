import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.onTapped,
    required this.needToShowContent,
    required this.needToShowExpandedStory,
  });
  final bool onTapped;
  final bool needToShowExpandedStory;
  final bool needToShowContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.decelerate,
              height: needToShowExpandedStory ? 180 : 64,
              width: needToShowExpandedStory ? 128 : 64,
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(needToShowExpandedStory ? 10 : 100),
                ),
                gradient: onTapped
                    ? const LinearGradient(
                        colors: [
                          Color(0xff4A4B4B),
                          Color(0xffD1534C),
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      )
                    : null,
                image: onTapped
                    ? null
                    : const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/images/The Good Guy Cover.png',
                        ),
                      ),
              ),
              child: needToShowContent
                  ? Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Assets.svg.quotation.svg(),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'Life is like a time machine, it takes you to future',
                                  style: TextStyle(
                                    fontFamily: 'NB',
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: RotatedBox(
                                      quarterTurns: 2,
                                      child: Assets.svg.quotation.svg(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: -2,
                          left: 8,
                          child: SizedBox(
                            height: 54,
                            width: 37,
                            child: FittedBox(
                              fit: BoxFit.cover,
                              child: Image.asset(
                                'assets/images/The Good Guy Cover.png',
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  : null,
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 200),
              curve: Curves.decelerate,
              opacity: onTapped ? 0.0 : 1.0,
              child: Container(
                height: 76,
                width: 76,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(
                    width: 1,
                    color: AppColors.greenAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          curve: Curves.decelerate,
          opacity: onTapped ? 0.0 : 1.0,
          child: const SizedBox(
            width: 76,
            child: Text(
              'James Wood',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'NR',
                fontSize: 10,
                color: AppColors.greyLight,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
