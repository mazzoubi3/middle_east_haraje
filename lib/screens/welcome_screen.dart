import 'package:get/get.dart';
import 'package:middle_east_haraje/constants/colors.dart';
import 'package:middle_east_haraje/constants/widgets.dart';
import 'package:middle_east_haraje/screens/auth/login_screen.dart';
import 'package:middle_east_haraje/screens/auth/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  static const screenId = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: welcomeBodyWidget(context),
    );
  }

  Widget welcomeBodyWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Image.asset(
                'assets/logo1.png',
                width: double.infinity,
                height: 350,
              ),
            )
          ]),
        ),
        _bottomNavigationBar(context),
      ],
    );
  }

  Widget _bottomNavigationBar(context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: roundedButton(
              context: context,
              bgColor: whiteColor,
              borderColor: blackColor,
              textColor: blackColor,
              text: 'Log In',
              onPressed: () {
                Get.to(LoginScreen(),transition: Transition.fadeIn,duration: Duration(seconds: 2));
              }),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: roundedButton(
              context: context,
              bgColor: secondaryColor,
              text: 'Sign Up',
              textColor: whiteColor,
              onPressed: () {
                Navigator.pushNamed(context, RegisterScreen.screenId);
              }),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
