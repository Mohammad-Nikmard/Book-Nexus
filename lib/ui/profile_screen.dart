import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/widgets/custom_back_button.dart';
import 'package:book_nexsus/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                onTap: () => Navigator.pop(context),
                child: const CustomBackIcon(
                  text: 'Back',
                ),
              ),
              const SizedBox(height: 24),
              AnimationLimiter(
                child: Row(
                  children: AnimationConfiguration.toStaggeredList(
                    childAnimationBuilder: (widget) {
                      return SlideAnimation(
                        horizontalOffset: -200,
                        duration: const Duration(milliseconds: 1500),
                        child: FadeInAnimation(child: widget),
                      );
                    },
                    children: [
                      const Text(
                        'Profile details',
                        style: TextStyle(
                          fontFamily: 'NM',
                          fontSize: 28,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    const CircleAvatar(
                      radius: 55,
                      backgroundColor: AppColors.black,
                    ),
                    Positioned(
                      right: 5,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          color: AppColors.greenAccent,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/images/icon_upload.svg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'Change profile picture',
                  style: TextStyle(
                    fontFamily: 'NM',
                    fontSize: 14,
                    color: AppColors.greenAccent,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              const Divider(
                thickness: 1,
                color: AppColors.greyDark,
              ),
              const SizedBox(height: 32),
              const _UserProfileInputs(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserProfileInputs extends StatefulWidget {
  const _UserProfileInputs();

  @override
  State<_UserProfileInputs> createState() => _UserProfileInputsState();
}

class _UserProfileInputsState extends State<_UserProfileInputs> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController dateController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: 'Mohammad Nikmard');
    emailController = TextEditingController(text: 'mnikmard1344@gmail.com');
    dateController = TextEditingController(text: '8 August, 2004');
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    dateController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Your Name',
          style: TextStyle(
            fontFamily: 'NR',
            fontSize: 14,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          textColor: AppColors.white,
          fillColor: const Color(0xff272828),
          controller: nameController,
          hintText: '',
          suffixIcon: SizedBox(
            height: 24,
            width: 24,
            child: Center(
              child: SvgPicture.asset(
                'assets/images/icon_arrow_right.svg',
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Email',
          style: TextStyle(
            fontFamily: 'NR',
            fontSize: 14,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          textColor: AppColors.white,
          fillColor: const Color(0xff272828),
          controller: emailController,
          hintText: '',
          suffixIcon: SizedBox(
            height: 24,
            width: 24,
            child: Center(
              child: SvgPicture.asset(
                'assets/images/icon_arrow_right.svg',
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Date of Birth',
          style: TextStyle(
            fontFamily: 'NR',
            fontSize: 14,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          textColor: AppColors.white,
          fillColor: const Color(0xff272828),
          controller: dateController,
          hintText: '',
          suffixIcon: SizedBox(
            height: 24,
            width: 24,
            child: Center(
              child: SvgPicture.asset(
                'assets/images/icon_arrow_right.svg',
              ),
            ),
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
