import 'package:middle_east_haraje/components/large_heading_widget.dart';
import 'package:middle_east_haraje/constants/colors.dart';
import 'package:middle_east_haraje/forms/login_form.dart';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String screenId = 'login_screen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: _body(),
    );
  }

  _body() {
    return  SingleChildScrollView(
      child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Image.asset(
                  'assets/logo1.png',
                  width: double.infinity,
                  height: 350,
                ),
              )
            ]),

            const LogInForm(),
      ]),
    );
  }
}
