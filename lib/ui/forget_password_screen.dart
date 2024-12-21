import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/widgets/custom_back_button.dart';
import 'package:book_nexsus/widgets/custom_blur_box.dart';
import 'package:book_nexsus/widgets/custom_elevated_button.dart';
import 'package:book_nexsus/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/background_guy.png',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              const Positioned(
                top: 16,
                left: 16,
                child: CustomBackIcon(
                  text: 'Back to Log in',
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: AnimationLimiter(
                          child: Row(
                            children: AnimationConfiguration.toStaggeredList(
                              childAnimationBuilder: (widget) {
                                return SlideAnimation(
                                  horizontalOffset: -300,
                                  duration: const Duration(milliseconds: 1500),
                                  child: FadeInAnimation(
                                    child: widget,
                                  ),
                                );
                              },
                              children: [
                                const Text(
                                  'Recover Password',
                                  style: TextStyle(
                                    fontFamily: 'NB',
                                    fontSize: 32,
                                    color: AppColors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const CustomBlurBox(
                        child: _BlurBoxContent(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlurBoxContent extends StatefulWidget {
  const _BlurBoxContent();

  @override
  State<_BlurBoxContent> createState() => _BlurBoxContentState();
}

class _BlurBoxContentState extends State<_BlurBoxContent> {
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Forgot your password? Don't worry, enter your email to reset your current password",
          style: TextStyle(
            fontFamily: 'NR',
            fontSize: 14,
            color: AppColors.white,
          ),
        ),
        const SizedBox(height: 24),
        CustomTextField(
          controller: emailController,
          hintText: 'Email',
        ),
        const SizedBox(height: 16),
        CustomElevatedButton(
          onPressed: () {},
          text: 'Submit',
        ),
        const SizedBox(height: 24),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(
                  fontFamily: 'NR',
                  fontSize: 16,
                  color: AppColors.white,
                ),
              ),
              TextSpan(
                text: 'Sign up',
                style: TextStyle(
                  fontFamily: 'NB',
                  fontSize: 16,
                  color: AppColors.greenAccent,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
