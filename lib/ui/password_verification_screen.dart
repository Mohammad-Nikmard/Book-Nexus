import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/ui/dashboard_screen.dart';
import 'package:book_nexsus/ui/login_with_email_screen.dart';
import 'package:book_nexsus/ui/login_with_password_screen.dart';
import 'package:book_nexsus/util/app_navigator.dart';
import 'package:book_nexsus/widgets/custom_back_button.dart';
import 'package:book_nexsus/widgets/custom_blur_box.dart';
import 'package:book_nexsus/widgets/custom_elevated_button.dart';
import 'package:book_nexsus/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';

class PasswordVerificationScreen extends StatelessWidget {
  const PasswordVerificationScreen({
    super.key,
    required this.isInLoginPassword,
  });
  final bool isInLoginPassword;

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
              Positioned(
                top: 16,
                left: 16,
                child: GestureDetector(
                  onTap: () => AppNavigator.navigateReplacement(
                    context,
                    isInLoginPassword
                        ? const LoginWithPasswordScreen()
                        : const LoginWithEmailScreen(),
                  ),
                  child: const CustomBackIcon(
                    text: 'Back to Log in',
                  ),
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
                                  horizontalOffset: -280,
                                  duration: const Duration(milliseconds: 1500),
                                  child: FadeInAnimation(
                                    child: widget,
                                  ),
                                );
                              },
                              children: [
                                const Text(
                                  'Verify Code',
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
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "An authentication code has been sent to your email",
          style: TextStyle(
            fontFamily: 'NR',
            fontSize: 14,
            color: AppColors.white,
          ),
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: 24),
        CustomTextField(
          controller: emailController,
          hintText: 'Email',
        ),
        const SizedBox(height: 16),
        CustomElevatedButton(
          onPressed: () => AppNavigator.navigateReplacement(
            context,
            const DashboardScreen(),
          ),
          text: 'Verify',
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: "Didn't receive a code? ",
                    style: TextStyle(
                      fontFamily: 'NR',
                      fontSize: 16,
                      color: AppColors.white,
                    ),
                  ),
                  TextSpan(
                    text: 'Resend ',
                    style: TextStyle(
                      fontFamily: 'NB',
                      fontSize: 16,
                      color: AppColors.greenAccent,
                    ),
                  ),
                ],
              ),
            ),
            SvgPicture.asset(
              'assets/images/icon_reload.svg',
              height: 14,
              width: 14,
            ),
          ],
        ),
      ],
    );
  }
}
