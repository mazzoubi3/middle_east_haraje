import 'package:get/get.dart';
import 'package:middle_east_haraje/constants/colors.dart';
import 'package:middle_east_haraje/constants/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../controller/auth_controller.dart';

class ProfileScreen extends StatefulWidget {
  static const screenId = 'profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    AuthController con = Get.put(AuthController());

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(secondaryColor),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50))),
              onPressed: () async {
                con.logOut(context);

                loadingDialogBox(context, 'Signing Out');

                Navigator.of(context).pop();
                // await FirebaseAuth.instance.signOut().then((value) {
                //   Navigator.of(context).pushNamedAndRemoveUntil(
                //       WelcomeScreen.screenId, (route) => false);
                // });
              },
              child: const Text(
                'Sign Out',
              ))
        ],
      ),
    );
  }
}
