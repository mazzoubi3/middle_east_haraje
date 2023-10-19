// import 'dart:convert';
//
// import 'package:awesome_dialog/awesome_dialog.dart' as dialog;
// import 'package:get/get.dart';
// import 'package:http/http.dart'as http;
//
// import '../core/conestant.dart';
// import '../main.dart';
//
// class DoctorController extends GetxController {
//
//
//   Future doctorList() async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse(baseLinkDoctorsList),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}' ?? ''});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//   Future statementList(String id) async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse('$baseLinkStatementList/$id'),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}' ?? ''});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//   Future doctorDate(String id) async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse('$baseLinkDoctorDate/$id'),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}' ?? ''});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//   Future healthDate(String id) async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse('$baseLinkHealthDate/$id'),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}' ?? ''});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//   Future medicalHistory() async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse(baseLinkMedicalHistory),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}' ?? ''});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//   Future medicalExamination(String id) async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse('$baseLinkMedicalExamination/$id'),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}' ?? ''});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//   Future instruction(String id) async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse('$baseLinkInstruction/$id'),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}'});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//   Future treatmentList(String id) async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse('$baseLinkTreatmentList/$id'),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}'});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//   Future treatment(String id) async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse('$baseLinkTreatment/$id'),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}'});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//   Future surgery(String id) async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse('$baseLinkSurgery/$id'),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}' ?? ''});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//   Future surgeryShow(String id) async {
//     print(sharedPreferences.getString('token'));
//     var response = await http.get(
//         Uri.parse('$baseLinkSurgeryShow/$id'),
//         headers: {'Authorization':'Bearer ${sharedPreferences.getString('token')}'});
//     var responseData = utf8.decode(response.bodyBytes);
//     print(json.decode(responseData));
//     return json.decode(responseData);
//   }
//
//
// }
