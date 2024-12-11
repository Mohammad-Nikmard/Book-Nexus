import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/widgets/custom_blur_box.dart';
import 'package:book_nexsus/widgets/custom_elevated_button.dart';
import 'package:book_nexsus/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordVerificationScreen extends StatefulWidget {
  const PasswordVerificationScreen({super.key});

  @override
  State<PasswordVerificationScreen> createState() =>
      _PasswordVerificationScreenState();
}

class _PasswordVerificationScreenState
    extends State<PasswordVerificationScreen> {
  final TextEditingController emailController = TextEditingController();
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
                child: _BackToLoginButton(),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Verify Code',
                          style: TextStyle(
                            fontFamily: 'NB',
                            fontSize: 32,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      CustomBlurBox(
                        child: Column(
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
                              onPressed: () {},
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
                        ),
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

class _BackToLoginButton extends StatelessWidget {
  const _BackToLoginButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/icon_arrow_left.svg',
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 8),
          const Text(
            'Back to login',
            style: TextStyle(
              fontFamily: 'NM',
              fontSize: 16,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
