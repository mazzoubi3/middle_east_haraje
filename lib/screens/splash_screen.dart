import 'dart:async';
import 'package:get/get.dart';
import 'package:middle_east_haraje/constants/colors.dart';
import 'package:middle_east_haraje/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  static const String screenId = 'splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    permissionBasedNavigationFunc();
    super.initState();
  }

  permissionBasedNavigationFunc() {
    Timer(const Duration(seconds: 2), () async {
      Get.offAll(const WelcomeScreen(),transition: Transition.fadeIn,duration: const Duration(seconds: 2));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffFFFFFF),Color(0xff5D95E0)]
          )
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            "assets/logo1.png",
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}
