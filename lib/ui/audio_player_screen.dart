import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/extensions/context_extension.dart';
import 'package:book_nexsus/gen/assets.gen.dart';
import 'package:book_nexsus/ui/book_read_screen.dart';
import 'package:flutter/material.dart';

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
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: SizedBox(
                    height: 600,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            Assets.images.duneBookCover.path,
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
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 16,
                            bottom: context.screenHeight < 700 ? 60 : 100,
                          ),
                          child: SafeArea(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () => context.pop,
                                  child: Assets.svg.arrowDown.svg(
                                    height: 32,
                                    width: 32,
                                    colorFilter: const ColorFilter.mode(
                                      Colors.white,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                                Assets.svg.moreVertical.svg(),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: context.screenHeight < 700 ? 60 : 100,
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                            child: SizedBox(
                              height: 249,
                              width: 173,
                              child: Center(
                                child: Image.asset(
                                  Assets.images.duneBookCover.path,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Dune',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'NB',
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'By Frank Herbert',
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
                                Assets.svg.skipForward.svg(),
                                Assets.svg.skipTenBackward.svg(),
                                Container(
                                  height: 64,
                                  width: 64,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.greenAccent,
                                  ),
                                  child: Center(
                                    child: Assets.svg.play.svg(
                                      height: 36,
                                      width: 36,
                                    ),
                                  ),
                                ),
                                Assets.svg.skipTenBackward.svg(),
                                Assets.svg.skipBackward.svg(),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Assets.svg.moon.svg(),
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
                              transitionDuration:
                                  const Duration(milliseconds: 300),
                              transitionType: ContainerTransitionType.fade,
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
      height: 330,
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
              Assets.svg.open.svg(),
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
                        Assets.svg.share.svg(),
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
