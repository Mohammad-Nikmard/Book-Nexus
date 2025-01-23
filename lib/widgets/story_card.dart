import 'package:book_nexsus/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StoryCard extends StatefulWidget {
  const StoryCard({super.key});

  @override
  State<StoryCard> createState() => _StoryCardState();
}

class _StoryCardState extends State<StoryCard> {
  bool onTapped = false;
  bool needToShowExpandedStory = false;
  bool needToShowContent = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
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
          setState(() {
            needToShowContent = false;
          });

          await Future.delayed(
            const Duration(milliseconds: 300),
            () {
              setState(() {
                needToShowExpandedStory = false;
              });
            },
          );
          await Future.delayed(
            const Duration(milliseconds: 300),
            () {
              setState(() {
                onTapped = false;
              });
            },
          );
        }
      },
      child: Column(
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
                  borderRadius: needToShowContent
                      ? const BorderRadius.all(
                          Radius.circular(10),
                        )
                      : null,
                  shape: needToShowExpandedStory
                      ? BoxShape.rectangle
                      : BoxShape.circle,
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
                                    SvgPicture.asset(
                                      'assets/images/icon_quotation.svg',
                                    ),
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
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: RotatedBox(
                                        quarterTurns: 2,
                                        child: SvgPicture.asset(
                                          'assets/images/icon_quotation.svg',
                                        ),
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
      ),
    );
  }
}
