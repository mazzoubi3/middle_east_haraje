import 'package:middle_east_haraje/components/large_heading_widget.dart';
import 'package:middle_east_haraje/constants/colors.dart';
import 'package:middle_east_haraje/forms/register_form.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  static const screenId = 'register_screen';
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: _body(),
    );
  }
}

_body() {
  return SingleChildScrollView(
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.symmetric( horizontal: 50),
            child: Image.asset(
              'assets/logo1.png',
              width: double.infinity,
              height:250,
            ),
          )
        ]),


      const RegisterForm(),
    ]),
  );
}
