import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/extensions/context_extension.dart';
import 'package:book_nexsus/gen/assets.gen.dart';
import 'package:book_nexsus/ui/login_with_email_screen.dart';
import 'package:book_nexsus/widgets/custom_blur_box.dart';
import 'package:book_nexsus/widgets/custom_elevated_button.dart';
import 'package:book_nexsus/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: AnimationLimiter(
                  child: Row(
                    children: AnimationConfiguration.toStaggeredList(
                      childAnimationBuilder: (widget) {
                        return SlideAnimation(
                          horizontalOffset: -290,
                          duration: const Duration(milliseconds: 1500),
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        );
                      },
                      children: [
                        const Text(
                          'Set Password',
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
    );
  }
}

class _BlurBoxContent extends StatefulWidget {
  const _BlurBoxContent();

  @override
  _BlurBoxContentState createState() => _BlurBoxContentState();
}

class _BlurBoxContentState extends State<_BlurBoxContent> {
  late TextEditingController passwordController;
  late TextEditingController passwordConfirmController;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
    passwordConfirmController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    passwordConfirmController.dispose();
    passwordController.dispose();
  }

  bool isPasswordVisible = true;
  bool isPasswordConfirmVisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Assets.svg.check.svg(
            height: 64,
            width: 64,
          ),
        ),
        const Center(
          child: Text(
            'Code Verified',
            style: TextStyle(
              fontFamily: 'NM',
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
        ),
        const SizedBox(height: 24),
        CustomTextField(
          controller: passwordController,
          hintText: 'Enter new password',
          obscureText: isPasswordVisible,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            child: isPasswordVisible
                ? SizedBox(
                    height: 24,
                    width: 24,
                    child: Center(
                      child: Assets.svg.eyeClose.svg(),
                    ),
                  )
                : const Icon(
                    Icons.remove_red_eye,
                    size: 24,
                  ),
          ),
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: passwordConfirmController,
          hintText: 'Re-type new password',
          obscureText: isPasswordConfirmVisible,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isPasswordConfirmVisible = !isPasswordConfirmVisible;
              });
            },
            child: isPasswordConfirmVisible
                ? SizedBox(
                    height: 24,
                    width: 24,
                    child: Center(
                      child: Assets.svg.eyeClose.svg(),
                    ),
                  )
                : const Icon(
                    Icons.remove_red_eye,
                    size: 24,
                  ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'At-least 8 characters',
          style: TextStyle(
            fontFamily: 'NR',
            fontSize: 14,
            color: AppColors.greyLight,
          ),
        ),
        const SizedBox(height: 16),
        CustomElevatedButton(
          onPressed: () =>
              context.pushReplacement(const LoginWithEmailScreen()),
          text: 'Set Password',
        ),
      ],
    );
  }
}
