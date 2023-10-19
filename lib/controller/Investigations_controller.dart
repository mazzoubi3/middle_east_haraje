// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:http/http.dart'as http;
//
// import '../core/conestant.dart';
// import '../main.dart';
//
// class InvestigationsController extends GetxController {
//
//   Future investigations(String id) async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse('$baseLinkInvestigations/$id'),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}'});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//   Future investigationsList(String id) async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse('$baseLinkInvestigationsList/$id'),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}'});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//   Future investigationsListShow(String id) async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse('$baseLinkInvestigationsListShow/$id'),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}'});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//
//
// }
