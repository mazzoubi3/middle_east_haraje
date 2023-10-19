import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyLocaleController extends GetxController {
  Locale? intialLang = Get.deviceLocale;

  void changeLang(String codeLang) {
    Locale locale = Locale(codeLang);
    Get.updateLocale(locale);
}

  String? val;

  Future get_data() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    val = sharedPreferences.getString('lang');
    return sharedPreferences.getString('lang');
  }


  // Future postLanguage(String id) async {
  //   var response =
  //   await post(Uri.parse(baseLinkLang), body: {
  //     'lang': id,
  //   });
  //
  //   if (response.statusCode == 200) {
  //     print(json.decode(response.body));
  //     return json.decode(response.body);
  //     // group=data['group'];
  //   } else {
  //     print("Error");
  //   }
  // }

}
