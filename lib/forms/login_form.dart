import 'package:get/get.dart';
import 'package:middle_east_haraje/components/login_buttons.dart';
import 'package:middle_east_haraje/constants/colors.dart';
import 'package:middle_east_haraje/constants/validators.dart';
import 'package:middle_east_haraje/constants/widgets.dart';
import 'package:middle_east_haraje/screens/auth/register_screen.dart';
import 'package:middle_east_haraje/screens/auth/reset_password_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../controller/auth_controller.dart';
import '../screens/home_screen.dart';


class LogInForm extends StatefulWidget {
  const LogInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _emailNode;
  late final FocusNode _passwordNode;
  final _formKey = GlobalKey<FormState>();
  bool obsecure = true;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailNode = FocusNode();
    _passwordNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailNode.dispose();
    _passwordNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthController con = Get.put(AuthController());

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  focusNode: _emailNode,
                  controller: _emailController,
                  validator: (value) {
                    return validateEmail(
                        value, EmailValidator.validate(_emailController.text));
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your Email',
                      hintStyle: TextStyle(
                        color: greyColor,
                        fontSize: 12,
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  focusNode: _passwordNode,
                  controller: _passwordController,
                  validator: (value) {
                    return validatePassword(value, _passwordController.text);
                  },
                  obscureText: obsecure,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(
                            Icons.remove_red_eye_outlined,
                            color: obsecure ? greyColor : blackColor,
                          ),
                          onPressed: () {
                            setState(() {
                              obsecure = !obsecure;
                            });
                          }),
                      labelText: 'Password',
                      hintText: 'Enter Your Password',
                      hintStyle: TextStyle(
                        color: greyColor,
                        fontSize: 12,
                      ),
                      contentPadding: const EdgeInsets.all(20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(
                    top: 10,
                    right: 5,
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.to(const ResetPasswordScreen(),transition: Transition.fadeIn,duration: const Duration(seconds: 1));

                    },
                    child: Text(
                      'Forgot Password ?',
                      style: TextStyle(
                        color: blackColor,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                roundedButton(
                    context: context,
                    bgColor: secondaryColor,
                    text: 'Sign In',
                    textColor: whiteColor,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        con.loginApi(email: _emailController.text,password: _passwordController.text,context: context).then((value) {
                          if(value['success']==true){
                            Get.to(const HomeScreen(),transition: Transition.fadeIn,duration: const Duration(seconds: 1));

                          }
                        });
                      }
                    }),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            text: 'Don\'t have an account? ',
            children: [
              TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Get.to(const RegisterScreen(),transition: Transition.fadeIn,duration: const Duration(seconds: 1));

                  },
                text: 'Create new account',
                style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 14,
                  color: secondaryColor,
                ),
              )
            ],
            style: TextStyle(
              fontFamily: 'Oswald',
              fontSize: 14,
              color: greyColor,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        // Text(
        //   'Or',
        //   style: TextStyle(
        //     fontSize: 18,
        //     color: greyColor,
        //   ),
        // ),
        // const SizedBox(
        //   height: 15,
        // ),
        // const LoginInButtons(),
      ],
    );
  }
}
