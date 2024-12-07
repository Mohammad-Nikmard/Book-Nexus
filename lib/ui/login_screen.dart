import 'package:book_nexsus/constants/constants.dart';
import 'package:book_nexsus/widgets/custom_blur_box.dart';
import 'package:book_nexsus/widgets/custom_elevated_button.dart';
import 'package:book_nexsus/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
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
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomBlurBox(
                    child: _BlurBoxContent(
                      emailController: emailController,
                    ),
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

class _BlurBoxContent extends StatelessWidget {
  const _BlurBoxContent({
    required this.emailController,
  });
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: emailController,
          hintText: 'Email',
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
            fontSize: 16,
            color: AppColors.greenAccent,
          ),
        ),
        const SizedBox(height: 24),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 152,
              child: Divider(
                thickness: 1.5,
                color: Color(0xff313333),
              ),
            ),
            Text(
              'Or',
              style: TextStyle(
                fontFamily: 'NR',
                fontSize: 14,
                color: AppColors.greyDark,
              ),
            ),
            SizedBox(
              width: 152,
              child: Divider(
                thickness: 1.5,
                color: Color(0xff313333),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        const _CustomLoginOptionBox(
          text: 'Login with Facebook',
          icon: 'icon_facebook',
        ),
        const SizedBox(height: 16),
        const _CustomLoginOptionBox(
          text: 'Login with Google',
          icon: 'icon_google',
        ),
        const SizedBox(height: 16),
        const _CustomLoginOptionBox(
          text: 'Login with Apple',
          icon: 'icon_apple',
        ),
        const SizedBox(height: 32),
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

class _CustomLoginOptionBox extends StatelessWidget {
  const _CustomLoginOptionBox({
    required this.text,
    required this.icon,
  });
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(8),
      ),
      child: ColoredBox(
        color: AppColors.white,
        child: SizedBox(
          height: 48,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/images/$icon.svg',
                  height: 24,
                  width: 24,
                ),
                Text(
                  text,
                  style: const TextStyle(
                    fontFamily: 'NB',
                    fontSize: 14,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(
                  height: 24,
                  width: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
