import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/ui/book_read_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AudioPlayerScreen extends StatelessWidget {
  const AudioPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 100),
                  child: SizedBox(
                    height: 357,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/The Good Guy Cover.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 16,
                            bottom: MediaQuery.of(context).size.height < 700
                                ? 60
                                : 100,
                          ),
                          child: SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => Navigator.pop(context),
                                  child: SvgPicture.asset(
                                    'assets/images/icon_arrow_down.svg',
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/images/icon_more_vertical.svg',
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height < 700
                                ? 60
                                : 100,
                          ),
                          child: SizedBox(
                            height: 249,
                            width: 173,
                            child: Center(
                              child: Image.asset(
                                'assets/images/The Good Guy Cover.png',
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'The Good Guy',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'NB',
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'By Kory Kogon, Suzette Blakemore, and James wood',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'NR',
                                color: AppColors.greyLight,
                              ),
                            ),
                            const SizedBox(height: 24),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                overlayShape: SliderComponentShape.noOverlay,
                                thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 5,
                                ),
                              ),
                              child: Slider(
                                value: 0.0,
                                thumbColor: Colors.white,
                                inactiveColor: const Color(0xff232538),
                                onChanged: (value) {},
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '0:00',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'NR',
                                    color: AppColors.greyLight,
                                  ),
                                ),
                                Text(
                                  '-2:08',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'NR',
                                    color: AppColors.greyLight,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/icon_skip_forward.svg',
                                ),
                                SvgPicture.asset(
                                  'assets/images/icon_skip_ten_forward.svg',
                                ),
                                Container(
                                  height: 64,
                                  width: 64,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.greenAccent,
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/images/icon_play.svg',
                                      height: 36,
                                      width: 36,
                                    ),
                                  ),
                                ),
                                SvgPicture.asset(
                                  'assets/images/icon_skip_ten_backward.svg',
                                ),
                                SvgPicture.asset(
                                  'assets/images/icon_skip_backward.svg',
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/icon_moon.svg',
                                ),
                                const Text(
                                  '1.0x',
                                  style: TextStyle(
                                    fontFamily: 'NM',
                                    fontSize: 14,
                                    color: Color(
                                      0xffEAF4F4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 18),
                            OpenContainer(
                              openColor: Colors.transparent,
                              closedColor: Colors.transparent,
                              middleColor: Colors.transparent,
                              transitionDuration: const Duration(seconds: 1),
                              transitionType:
                                  ContainerTransitionType.fadeThrough,
                              closedElevation: 0.0,
                              openBuilder: (context, _) =>
                                  const BookReadScreen(),
                              closedBuilder: (context, openContainer) =>
                                  const _BookReadCard(),
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BookReadCard extends StatelessWidget {
  const _BookReadCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 392,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
        color: AppColors.blueBG,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Readings',
                style: TextStyle(
                  fontFamily: 'NR',
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              SvgPicture.asset(
                'assets/images/icon_open.svg',
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove right at the coast of the Semantics, a large language ocean. A small river named Duden flows by their place and supplies it with the necessary regelialia. It is a paradisematic country, in which roasted parts of sentences fly into your mouth.',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: 'NM',
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
                child: SizedBox(
                  height: 28,
                  width: 86,
                  child: ColoredBox(
                    color: AppColors.greenAccent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/images/icon_share.svg'),
                        const SizedBox(width: 5),
                        const Text(
                          'Share',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.blueBG,
                            fontFamily: 'NB',
                          ),
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
    );
  }
}
