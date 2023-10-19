// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../main.dart';
// import 'locale_controller.dart';
//
// class TranslateButton extends StatelessWidget {
//   const TranslateButton({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     MyLocaleController controller = Get.put(MyLocaleController());
//     return SafeArea(
//         child: Scaffold(
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Image.asset(
//               'images/icons/logo.png',
//               filterQuality: FilterQuality.high,
//               width: 500,
//               fit: BoxFit.fill,
//               height: 500,
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 GestureDetector(
//                   onTap: () async {
//                     controller.changeLang('ar');
//                     sharedPreferences!.setString('lang', 'ar');
//                     // const MLWalkThroughScreen().launch(context);
//                   },
//                   child: Container(
//                     height: 50,
//                     width: 120,
//                     decoration: BoxDecoration(
//                       gradient: mlPrimaryColorL,
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                       border: Border.all(color: mlColorDarkBlue, width: 2),
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0xFF1C1C1C).withOpacity(0.2),
//                           spreadRadius: 3,
//                           blurRadius: 4,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Center(
//                       child: Text(
//                         "عربي".tr,
//                         style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: mainLightColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     controller.changeLang('en');
//                     sharedPreferences.setString('lang', 'en');
//                     const MLWalkThroughScreen().launch(context);
//                   },
//                   child: Container(
//                     height: 50,
//                     width: 120,
//                     decoration: BoxDecoration(
//                       gradient: mlPrimaryColorL,
//                       borderRadius: const BorderRadius.all(
//                         Radius.circular(10),
//                       ),
//                       border: Border.all(color: mlColorDarkBlue, width: 2),
//                       boxShadow: [
//                         BoxShadow(
//                           color: const Color(0xFF1C1C1C).withOpacity(0.2),
//                           spreadRadius: 3,
//                           blurRadius: 4,
//                           offset: const Offset(0, 3),
//                         ),
//                       ],
//                     ),
//                     child: Center(
//                       child: Text(
//                         "English".tr,
//                         style: const TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w900,
//                           color: whiteColor,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//           ],
//         ),
//       ),
//     ));
//   }
// }
