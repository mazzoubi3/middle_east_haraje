import 'package:get/get.dart';
import 'package:middle_east_haraje/constants/colors.dart';
import 'package:middle_east_haraje/constants/validators.dart';
import 'package:middle_east_haraje/constants/widgets.dart';
import 'package:middle_east_haraje/screens/auth/login_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart' as dialog;

import '../controller/auth_controller.dart';

class ResetForm extends StatefulWidget {
  const ResetForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ResetForm> createState() => _ResetFormState();
}

class _ResetFormState extends State<ResetForm> {
  late final TextEditingController _emailController;
  late final FocusNode _emailNode;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _emailNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailNode.dispose();
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
                  height: 25,
                ),
                roundedButton(
                    context: context,
                    bgColor: secondaryColor,
                    text: 'Send Reset Link',
                    textColor: whiteColor,
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        con.forgetPassword(email: _emailController.text).then((value) {
                          if(value['success']==true){
                            dialog.AwesomeDialog(
                              context: context,
                              dialogType: dialog.DialogType.info,
                              animType: dialog.AnimType.bottomSlide,
                              title: 'انتبه  !'.tr,
                              desc: value['message'],
                              btnOkOnPress: () {},
                            ).show();
                          }
                        });
                      }
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
