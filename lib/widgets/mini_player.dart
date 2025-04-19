import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/extensions/context_extension.dart';
import 'package:book_nexsus/gen/assets.gen.dart';
import 'package:book_nexsus/ui/audio_player_screen.dart';
import 'package:flutter/material.dart';

class MiniPlayer extends StatelessWidget {
  const MiniPlayer({super.key});

  void openAudioPlayer(BuildContext context) {
    Navigator.of(context).push(_bottomToTopRoute());
  }

  Route _bottomToTopRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const AudioPlayerScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        GestureDetector(
          onTap: () => openAudioPlayer(context),
          child: SizedBox(
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
                        Assets.images.duneBookCover.path,
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
                            width: context.screenWidth * 0.55,
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
                            child: Assets.svg.play.svg(),
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
                            child: Assets.svg.forward.svg(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
