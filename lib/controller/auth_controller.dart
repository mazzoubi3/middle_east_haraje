import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

import 'package:awesome_dialog/awesome_dialog.dart' as dialog;
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/apiLink.dart';
import '../main.dart';

class AuthController extends GetxController {
  Map userData = {};

  Future loginApi({required String email, password, context}) async {
    var res = await http.post(Uri.parse(baseLinkLogin),
        headers: {'X-AppApiToken': apiKey},
        body: {
      'email': email,
      "password": password,
      "auth_field": 'email',
      "phone":'',
      "phone_country": '',
    });
    print(res.statusCode);
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      userData = data;

      print(json.decode(res.body));

      if (userData['success'] == true) {
        sharedPreferences!.setString('token', data['extra']['authToken'].toString());
        sharedPreferences!.setString('avtar', data['result']['photo_url'] ?? '');
        sharedPreferences!.setString('name', data['result']['name'] ?? '');
        sharedPreferences!.setString('id', data['result']['id'].toString());
      } else {
        dialog.AwesomeDialog(
          context: context,
          dialogType: dialog.DialogType.info,
          animType: dialog.AnimType.bottomSlide,
          title: 'انتبه  !'.tr,
          desc: 'الايميل او الرقم السري خاطئ',
          btnOkOnPress: () {},
        ).show();
      }
      print(json.decode(res.body));
      return json.decode(res.body);
    } else {
      dialog.AwesomeDialog(
        context: context,
        dialogType: dialog.DialogType.info,
        animType: dialog.AnimType.bottomSlide,
        title: 'انتبه  !'.tr,
        desc: 'الايميل او الرقم السري خاطئ',
        btnOkOnPress: () {},
      ).show();
    }

    print(sharedPreferences!.getString('token').toString());
    print(sharedPreferences!.getString('id').toString());
  }
  Future registerApi({required String name,email, phone,password,passwordConfirmation, context}) async {
    var res = await http.post(Uri.parse(baseLinkRegister),
        headers: {'X-AppApiToken': apiKey},
        body: {
      'country_code': 'SA',
      "name": name,
      "auth_field": 'email',
      "email": email,
      "phone":phone,
      "phone_country": 'SA',
      "password": password,
      "password_confirmation": passwordConfirmation,
      "accept_terms": '1',
    });
    print(res.statusCode);
    if (res.statusCode == 200) {
      var responseData = utf8.decode(res.bodyBytes);

      print(json.decode(responseData));

      return json.decode(responseData);

    } else {
      var responseData = utf8.decode(res.bodyBytes);

      print(json.decode(responseData));
var data=json.decode(responseData);
      dialog.AwesomeDialog(
        context: context,
        dialogType: dialog.DialogType.info,
        animType: dialog.AnimType.bottomSlide,
        title: 'انتبه  !'.tr,
        desc: data['message'],
        btnOkOnPress: () {},
      ).show();
      return json.decode(responseData);

    }

    print(sharedPreferences!.getString('id').toString());
  }
  Future forgetPassword({required String email, context}) async {
    var res = await http.post(Uri.parse(baseLinkForgetPassword),
        headers: {'X-AppApiToken': apiKey},
        body: {
      'email': email,
      "auth_field": 'email',
      "phone":'',
      "phone_country": '',
    });
    print(res.statusCode);
    if (res.statusCode == 200) {
      var data = utf8.decode(res.bodyBytes);
      var data1 = json.decode(res.body);
      userData = data1;

      print(json.decode(res.body));

      if (userData['success'] == true) {

      } else {
        dialog.AwesomeDialog(
          context: context,
          dialogType: dialog.DialogType.info,
          animType: dialog.AnimType.bottomSlide,
          title: 'انتبه  !'.tr,
          desc: 'الايميل  خاطئ',
          btnOkOnPress: () {},
        ).show();
      }
      print(json.decode(res.body));
      return json.decode(res.body);
    } else {
      dialog.AwesomeDialog(
        context: context,
        dialogType: dialog.DialogType.info,
        animType: dialog.AnimType.bottomSlide,
        title: 'انتبه  !'.tr,
        desc: 'الايميل  خاطئ',
        btnOkOnPress: () {},
      ).show();
    }
  }

  // Future changePass(
  //     {required String passOld, newPassword, conPassword, context}) async {
  //   var res = await http.post(Uri.parse(baseLinkChangePass), headers: {
  //     'Authorization': 'Bearer ${sharedPreferences.getString('token')}'
  //   }, body: {
  //     'current-password': passOld,
  //     "new-password": newPassword,
  //     "new-password_confirmation": conPassword,
  //   });
  //   if (res.statusCode == 200) {
  //     var data = json.decode(res.body);
  //     userData = data;
  //     print(json.decode(res.body));
  //     return json.decode(res.body);
  //   } else if (res.statusCode == 422) {
  //     var data = json.decode(res.body);
  //
  //     dialog.AwesomeDialog(
  //             context: context,
  //             dialogType: dialog.DialogType.info,
  //             animType: dialog.AnimType.bottomSlide,
  //             title: 'I notice  !'.tr,
  //             desc: data['errors']['new-password'][0],
  //             btnOkOnPress: () {})
  //         .show();
  //     print("Error");
  //   } else {
  //     dialog.AwesomeDialog(
  //             context: context,
  //             dialogType: dialog.DialogType.info,
  //             animType: dialog.AnimType.bottomSlide,
  //             title: 'I notice  !'.tr,
  //             desc: 'Please enter correct the id'.tr,
  //             btnOkOnPress: () {})
  //         .show();
  //     print("Error");
  //   }
  // }
  //
  Future logOut(context) async {
    var response = await http.get(Uri.parse(baseLinkLogout),
      headers: {
      'Authorization': sharedPreferences!.getString('token') ?? '',
      'X-AppApiToken': apiKey},

    );
    // response.headers.addAll(headers);

    if (response.statusCode == 200) {
      var responseData = utf8.decode(response.bodyBytes);

      print(json.decode(responseData));

      return json.decode(responseData);
    } else {
      dialog.AwesomeDialog(
              context: context,
              dialogType: dialog.DialogType.info,
              animType: dialog.AnimType.bottomSlide,
              title: 'I notice  !'.tr,
              desc: 'Unauthenticated'.tr,
              btnOkOnPress: () {})
          .show();
    }
  }
  //
  // // Future<void> uploadPhotoWithBody(
  // //     String imagePath, Map<String, String> bodyData) async {
  // //   final Uri uri = Uri.parse(baseLinkUpdateInfo);
  // //
  // //   final headers = {
  // //     'Authorization': 'Bearer ${sharedPreferences.getString('token')}',
  // //     // Add your authorization header if needed
  // //     'Accept': 'application/json',
  // //   };
  // //
  // //   var request = http.MultipartRequest('POST', uri)
  // //     ..headers.addAll(headers)
  // //     ..fields.addAll(bodyData) // Add your body data here
  // //     ..files.add(await http.MultipartFile.fromPath('avtar', imagePath));
  // //
  // //   try {
  // //     final response = await request.send();
  // //     if (response.statusCode == 200) {
  // //       print('Photo uploaded successfully');
  // //     } else {
  // //       print('Photo upload failed with status: ${response.statusCode}');
  // //     }
  // //   } catch (error) {
  // //     print('Error uploading photo: $error');
  // //   }
  // // }
  //
  // Future uploadFile(Map map, File file) async {
  //   print(sharedPreferences.getString('token'));
  //   var request = http.MultipartRequest('POST', Uri.parse(baseLinkUpdateInfo));
  //   var length = await file.length();
  //   var stream = http.ByteStream(file.openRead());
  //   var multiPartFile = http.MultipartFile('avtar', stream, length,
  //       filename: basename(file.path));
  //   request.files.add(multiPartFile);
  //   request.headers['Authorization'] =
  //       'Bearer ${sharedPreferences.getString('token')}';
  //   // request.headers['Accept'] = 'application/json';
  //   map.forEach((key, value) {
  //     request.fields[key] = '$value';
  //   });
  //   var myRequest = await request.send();
  //   var response = await http.Response.fromStream(myRequest);
  //   if (myRequest.statusCode == 200) {
  //     Map data = jsonDecode(response.body);
  //     print('***************************');
  //     sharedPreferences.setString('avtar', data['data']['avtar']);
  //     sharedPreferences.setString('path', data['link']);
  //     sharedPreferences.setString('info', json.encode(data['info']));
  //     sharedPreferences.setString('name', data['data']['name'] ?? '');
  //     sharedPreferences.setString(
  //         'blood_type', data['data']['blood_type'] ?? '');
  //     sharedPreferences.setString('gender', data['data']['gender'].toString());
  //     sharedPreferences.setString('id', data['data']['id'].toString());
  //     print(jsonDecode(response.body));
  //     return jsonDecode(response.body);
  //   } else {
  //     print('***************************');
  //     print(jsonDecode(response.body));
  //     print('Error ${myRequest.statusCode}');
  //   }
  // }
}
