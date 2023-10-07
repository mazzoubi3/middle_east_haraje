import 'package:middle_east_haraje/constants/colors.dart';
import 'package:middle_east_haraje/constants/validators.dart';
import 'package:middle_east_haraje/screens/location_screen.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../components/bottom_nav_widget.dart';

class UserFormReview extends StatefulWidget {
  static const screenId = 'user_form_review_screen';

  const UserFormReview({Key? key}) : super(key: key);

  @override
  State<UserFormReview> createState() => _UserFormReviewState();
}

class _UserFormReviewState extends State<UserFormReview> {


  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _countryCodeController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late FocusNode _nameNode;
  late FocusNode _countryCodeNode;
  late FocusNode _phoneNumberNode;
  late FocusNode _emailNode;
  late FocusNode _addressNode;
  @override
  void dispose() {
    _nameController.dispose();
    _countryCodeController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _nameNode.dispose();
    _countryCodeNode.dispose();
    _phoneNumberNode.dispose();
    _emailNode.dispose();
    _addressNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _countryCodeController = TextEditingController(text: '+91');
    _phoneNumberController = TextEditingController();
    _emailController = TextEditingController();
    _addressController = TextEditingController();
    _nameNode = FocusNode();
    _countryCodeNode = FocusNode();
    _phoneNumberNode = FocusNode();
    _emailNode = FocusNode();
    _addressNode = FocusNode();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: blackColor),
          backgroundColor: whiteColor,
          title: Text(
            'Review details',
            style: TextStyle(color: blackColor),
          )),
      body: userFormReviewBody(),
      bottomNavigationBar: BottomNavigationWidget(
        validator: true,
        buttonText: 'Confirm',
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
          }
        },
      ),
    );
  }

  userFormReviewBody() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: primaryColor,
                    radius: 40,
                    child: CircleAvatar(
                      backgroundColor: secondaryColor,
                      radius: 37,
                      child: Icon(
                        CupertinoIcons.person,
                        color: whiteColor,
                        size: 40,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                        focusNode: _nameNode,
                        controller: _nameController,
                        validator: (value) =>
                            checkNullEmptyValidation(value, "name"),
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            color: greyColor,
                            fontSize: 14,
                          ),
                          errorStyle: const TextStyle(
                              color: Colors.red, fontSize: 10),
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: blackColor)),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Contact Details',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                        focusNode: _countryCodeNode,
                        enabled: false,
                        controller: _countryCodeController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(15),
                          disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: disabledColor)),
                        )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                        focusNode: _phoneNumberNode,
                        controller: _phoneNumberController,
                        maxLength: 10,
                        maxLengthEnforcement: MaxLengthEnforcement.enforced,
                        validator: (value) => validateMobile(value),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          counterText: '',
                          labelText: 'Enter your phone number',
                          labelStyle: TextStyle(
                            color: greyColor,
                            fontSize: 14,
                          ),
                          errorStyle: const TextStyle(
                              color: Colors.red, fontSize: 10),
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: blackColor)),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  focusNode: _emailNode,
                  controller: _emailController,
                  validator: (value) => validateEmail(
                    value,
                    EmailValidator.validate(
                      _emailController.text,
                    ),
                  ),
                  decoration: InputDecoration(
                      labelText: 'Enter your email address',
                      labelStyle: TextStyle(
                        color: greyColor,
                        fontSize: 14,
                      ),
                      errorStyle:
                      const TextStyle(color: Colors.red, fontSize: 10),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: blackColor)))),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (builder) => LocationScreen(
                        onlyPop: true,
                        popToScreen: UserFormReview.screenId,
                      )));
                },
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          focusNode: _addressNode,
                          enabled: false,
                          controller: _addressController,
                          validator: (value) {
                            return checkNullEmptyValidation(
                                value, 'your address');
                          },
                          minLines: 2,
                          maxLines: 4,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            labelText: 'Address',
                            labelStyle: TextStyle(
                              color: greyColor,
                              fontSize: 14,
                            ),
                            errorStyle: const TextStyle(
                                color: Colors.red, fontSize: 10),
                            contentPadding: const EdgeInsets.all(15),
                          )),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
