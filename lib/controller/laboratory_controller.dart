// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:http/http.dart'as http;
//
// import '../core/conestant.dart';
// import '../main.dart';
//
// class LaboratoryController extends GetxController {
//
//   Future laboratory(String id) async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse('$baseLinkLaboratory/$id'),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}' ?? ''});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//   Future laboratoryList(String id) async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse('$baseLinkLaboratoryList/$id'),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}' ?? ''});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//   Future laboratoryListShow(String id) async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse('$baseLinkLaboratoryListShow/$id'),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}' ?? ''});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//
//
// }
