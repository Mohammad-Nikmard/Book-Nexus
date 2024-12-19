import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/widgets/custom_blur_box.dart';
import 'package:book_nexsus/widgets/custom_elevated_button.dart';
import 'package:book_nexsus/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  bool isPasswordObscured = true;
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 16),
                  child: AnimationLimiter(
                    child: Row(
                      children: AnimationConfiguration.toStaggeredList(
                        childAnimationBuilder: (widget) {
                          return SlideAnimation(
                            horizontalOffset: -240,
                            duration: const Duration(milliseconds: 1500),
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          );
                        },
                        children: [
                          const Text(
                            'Sign up',
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
                CustomBlurBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Look like you don't have an account.",
                        style: TextStyle(
                          fontFamily: 'NR',
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ),
                      const Text(
                        "Let's create a new account for you.",
                        style: TextStyle(
                          fontFamily: 'NR',
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ),
                      const SizedBox(height: 24),
                      CustomTextField(
                        controller: nameController,
                        hintText: 'Name',
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: emailController,
                        hintText: 'Email',
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isPasswordObscured = !isPasswordObscured;
                            });
                          },
                          child: isPasswordObscured
                              ? SizedBox(
                                  height: 24,
                                  width: 24,
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/images/icon_eye_close.svg',
                                    ),
                                  ),
                                )
                              : const Icon(
                                  Icons.remove_red_eye,
                                  size: 24,
                                  color: AppColors.greyLight,
                                ),
                        ),
                        obscureText: !isPasswordObscured,
                        controller: passwordController,
                        hintText: 'Password',
                      ),
                      const SizedBox(height: 16),
                      RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text:
                                  "By selecting Create Account below, i agree to ",
                              style: TextStyle(
                                fontFamily: 'NR',
                                fontSize: 16,
                                color: AppColors.white,
                              ),
                            ),
                            TextSpan(
                              text: 'Terms of Service & Privacy Policy',
                              style: TextStyle(
                                fontFamily: 'NB',
                                fontSize: 16,
                                color: AppColors.greenAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomElevatedButton(
                        onPressed: () {},
                        text: 'Create Account',
                      ),
                      const SizedBox(height: 24),
                      Center(
                        child: RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(
                                  fontFamily: 'NR',
                                  fontSize: 16,
                                  color: AppColors.white,
                                ),
                              ),
                              TextSpan(
                                text: 'Log in',
                                style: TextStyle(
                                  fontFamily: 'NB',
                                  fontSize: 16,
                                  color: AppColors.greenAccent,
                                ),
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
          ),
        ),
      ),
    );
  }
}
