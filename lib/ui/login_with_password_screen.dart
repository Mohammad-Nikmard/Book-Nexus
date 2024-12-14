import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/widgets/custom_blur_box.dart';
import 'package:book_nexsus/widgets/custom_elevated_button.dart';
import 'package:book_nexsus/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginWithPasswordScreen extends StatelessWidget {
  const LoginWithPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
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
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  'Log in',
                  style: TextStyle(
                    fontFamily: 'NB',
                    fontSize: 32,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(height: 16),
              CustomBlurBox(
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
  State<_BlurBoxContent> createState() => _BlurBoxContentState();
}

class _BlurBoxContentState extends State<_BlurBoxContent> {
  late TextEditingController passwordController;

  bool isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.black,
            ),
            const SizedBox(width: 16),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Mohammad Nikmard',
                  style: TextStyle(
                    fontFamily: 'NB',
                    fontSize: 16,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 4),
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
            const Spacer(),
            SvgPicture.asset(
              'assets/images/icon_check.svg',
              height: 24,
              width: 24,
            ),
          ],
        ),
        const SizedBox(height: 24),
        CustomTextField(
          controller: passwordController,
          hintText: 'Password',
          obscureText: isPasswordVisible,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            child: !isPasswordVisible
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
                  ),
          ),
        ),
        const SizedBox(height: 16),
        CustomElevatedButton(
          onPressed: () {},
          text: 'Continue',
        ),
        const SizedBox(height: 16),
        const Text(
          'Forgot Password?',
          style: TextStyle(
            fontFamily: 'NB',
            fontSize: 14,
            color: AppColors.greenAccent,
          ),
        ),
      ],
    );
  }
}
