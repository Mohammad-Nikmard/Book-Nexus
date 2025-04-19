import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/extensions/context_extension.dart';
import 'package:book_nexsus/gen/assets.gen.dart';
import 'package:book_nexsus/ui/profile_screen.dart';
import 'package:book_nexsus/widgets/custom_back_button.dart';
import 'package:book_nexsus/widgets/custom_divider_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => context.pop,
                child: const CustomBackIcon(
                  text: 'Home',
                ),
              ),
              const SizedBox(height: 24),
              const CustomDividerHeader(
                header: 'Account',
                boxWidth: 110,
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: AppColors.black,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mohammad Nikmard',
                        style: TextStyle(
                          fontFamily: 'NB',
                          fontSize: 16,
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        'mnikmard1344@gmail.com',
                        style: TextStyle(
                          fontFamily: 'NR',
                          fontSize: 14,
                          color: AppColors.greyLight,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: SizedBox(
                      height: 32,
                      width: 73,
                      child: ColoredBox(
                        color: AppColors.greenAccent,
                        child: Center(
                          child: Text(
                            'Premium',
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.blueBG,
                              fontFamily: 'NR',
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24),
              const Divider(
                color: AppColors.greyDark,
                thickness: 1,
              ),
              const SizedBox(height: 24),
              _AccountOptionRow(
                title: 'Profile details',
                icon: 'icon_user',
                onTapped: () => context.push(const ProfileScreen()),
                showArrow: true,
              ),
              _AccountOptionRow(
                title: 'Payment',
                icon: 'icon_payment',
                onTapped: () {},
                showArrow: true,
              ),
              _AccountOptionRow(
                title: 'Subscription',
                icon: 'icon_subsription',
                onTapped: () {},
                showArrow: true,
              ),
              const Divider(
                color: AppColors.greyDark,
                thickness: 1,
              ),
              const SizedBox(height: 24),
              _AccountOptionRow(
                title: 'FAQs',
                icon: 'icon_faq',
                onTapped: () {},
                showArrow: true,
              ),
              _AccountOptionRow(
                title: 'Logout',
                icon: 'icon_logout',
                onTapped: () {},
                showArrow: false,
              ),
              const Spacer(),
              const _SupportBox(),
            ],
          ),
        ),
      ),
    );
  }
}

class _SupportBox extends StatelessWidget {
  const _SupportBox();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      child: SizedBox(
        height: 64,
        width: double.infinity,
        child: ColoredBox(
          color: AppColors.blueBG,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.svg.support.svg(
                height: 24,
                width: 24,
              ),
              const SizedBox(width: 10),
              const Text(
                'Feel free to ask, We are here to help',
                style: TextStyle(
                  fontFamily: 'NM',
                  fontSize: 16,
                  color: AppColors.greenAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AccountOptionBox extends StatelessWidget {
  const _AccountOptionBox({
    required this.icon,
  });
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      child: SizedBox(
        height: 40,
        width: 40,
        child: ColoredBox(
          color: AppColors.greyDark,
          child: Center(
            child: SvgPicture.asset(
              'assets/images/$icon.svg',
              height: 24,
              width: 24,
            ),
          ),
        ),
      ),
    );
  }
}

class _AccountOptionRow extends StatelessWidget {
  const _AccountOptionRow({
    required this.title,
    required this.icon,
    required this.onTapped,
    required this.showArrow,
  });
  final String title;
  final String icon;
  final bool showArrow;
  final VoidCallback onTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: GestureDetector(
        onTap: () => onTapped(),
        child: Row(
          children: [
            _AccountOptionBox(
              icon: icon,
            ),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(
                fontFamily: 'NM',
                fontSize: 14,
                color: AppColors.white,
              ),
            ),
            const Spacer(),
            AnimationLimiter(
              child: Row(
                children: AnimationConfiguration.toStaggeredList(
                  childAnimationBuilder: (widget) {
                    return SlideAnimation(
                      horizontalOffset: 50,
                      duration: const Duration(milliseconds: 2000),
                      child: FadeInAnimation(child: widget),
                    );
                  },
                  children: [
                    Visibility(
                      visible: showArrow,
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: Center(
                          child: Assets.svg.arrowRight.svg(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
