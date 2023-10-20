// ignore_for_file: void_checks

import 'package:middle_east_haraje/components/bottom_nav_widget.dart';
import 'package:middle_east_haraje/components/image_picker_widget.dart';
import 'package:middle_east_haraje/constants/colors.dart';
import 'package:middle_east_haraje/constants/validators.dart';
import 'package:middle_east_haraje/constants/widgets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';

class CommonForm extends StatefulWidget {
  static const String screenId = 'common_form';
  const CommonForm({Key? key}) : super(key: key);

  @override
  State<CommonForm> createState() => _CommonFormState();
}

class _CommonFormState extends State<CommonForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _brandController;
  late FocusNode _brandNode;
  late TextEditingController _descriptionController;
  late FocusNode _descriptionNode;
  late TextEditingController _titleController;
  late FocusNode _titleNode;
  late TextEditingController _priceController;
  late FocusNode _priceNode;
  late TextEditingController _typeController;
  late FocusNode _typeNde;
  late TextEditingController _bedroomController;
  late FocusNode _bedroomNode;
  late TextEditingController _bathroomController;
  late FocusNode _bathroomNode;
  late TextEditingController _furnishController;
  late FocusNode _furnishNode;
  late TextEditingController _constructionController;
  late FocusNode _constructionNode;
  late TextEditingController _sqftController;
  late FocusNode _sqftNode;
  late TextEditingController _floorsController;
  late FocusNode _floorsNode;

  List accessoriesList = ['Mobile', 'Tablet'];
  List tabletList = ['IPads', 'Samsung', 'Other Tablets'];
  List appartmentList = ['Apartments', 'Farm Houses', 'Houses & Villas'];
  List bedroomList = ['1', '2', '3', '3+'];
  List bathroomList = ['1', '2', '3', '3+'];
  List furnishList = ['Full-Furnished', 'Semi-Furnished', 'Un-Furnished'];
  List constructionList = ['New Launch', 'Ready to Move', 'Under construction'];
  @override
  void initState() {
    _brandController = TextEditingController();
    _brandNode = FocusNode();
    _descriptionController = TextEditingController();
    _descriptionNode = FocusNode();
    _titleController = TextEditingController();
    _titleNode = FocusNode();
    _priceController = TextEditingController();
    _priceNode = FocusNode();
    _typeController = TextEditingController();
    _typeNde = FocusNode();
    _bedroomController = TextEditingController();
    _bedroomNode = FocusNode();
    _bathroomController = TextEditingController();
    _bathroomNode = FocusNode();
    _furnishController = TextEditingController();
    _furnishNode = FocusNode();
    _constructionController = TextEditingController();
    _constructionNode = FocusNode();
    _sqftController = TextEditingController();
    _sqftNode = FocusNode();
    _floorsController = TextEditingController();
    _floorsNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _brandController.dispose();
    _brandNode.dispose();
    _descriptionController.dispose();
    _descriptionNode.dispose();
    _titleController.dispose();
    _titleNode.dispose();
    _priceController.dispose();
    _priceNode.dispose();
    _typeController.dispose();
    _typeNde.dispose();
    _bedroomController.dispose();
    _bedroomNode.dispose();
    _bathroomController.dispose();
    _bathroomNode.dispose();
    _furnishController.dispose();
    _furnishNode.dispose();
    _constructionController.dispose();
    _constructionNode.dispose();
    _sqftController.dispose();
    _sqftNode.dispose();
    _floorsController.dispose();
    _floorsNode.dispose();
    super.dispose();
  }
  List data=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: blackColor),
          backgroundColor: whiteColor,
          title: Text(
            ' Details',
            style: TextStyle(color: blackColor),
          )),
      body: formBodyWidget(context),
      bottomNavigationBar: BottomNavigationWidget(
        buttonText: 'Next',
        validator: true,
        onPressed: () async {

        },
      ),
    );
  }

  brandBottomSheet(context) {
    return openBottomSheet(
      context: context,
      appBarTitle: 'Select Brand',
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {

                Navigator.pop(context);
              },
              title: const Text('iphone'),
              leading: Image.network(
              '',
                width: 35,
                height: 35,
              ),
            );
          }),
    );
  }

  commonBottomsheet(context, list, controller) {
    return openBottomSheet(
      context: context,
      appBarTitle: 'Select type',
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                setState(() {
                  controller.text = list[index];
                });
                Navigator.pop(context);
              },
              title: Text(list[index]),
            );
          }),
    );
  }

  formBodyWidget(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(left: 20, top: 10, right: 10, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'iphone',
                  style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                     InkWell(
                        onTap: () =>
                            brandBottomSheet(context),
                        child: TextFormField(
                            focusNode: _brandNode,
                            controller: _brandController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please choose your model brand';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: 'Brand',
                              errorStyle: const TextStyle(
                                  color: Colors.red, fontSize: 10),
                              labelStyle: TextStyle(
                                color: greyColor,
                                fontSize: 14,
                              ),
                              suffixIcon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: blackColor,
                                size: 30,
                              ),
                              hintText: 'Enter your mobile brand',
                              hintStyle: TextStyle(
                                color: greyColor,
                                fontSize: 14,
                              ),
                              contentPadding: const EdgeInsets.all(15),
                            )),
                      ),

                     InkWell(
                        onTap: () {

                        },
                        child: TextFormField(
                            focusNode: _typeNde,
                            controller: _typeController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please choose your type';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            enabled: false,
                            decoration: InputDecoration(
                              labelText: 'Type*',
                              errorStyle: const TextStyle(
                                  color: Colors.red, fontSize: 10),
                              labelStyle: TextStyle(
                                color: greyColor,
                                fontSize: 14,
                              ),
                              suffixIcon: Icon(
                                Icons.arrow_drop_down_sharp,
                                color: blackColor,
                                size: 30,
                              ),
                              hintText: 'Enter your type',
                              hintStyle: TextStyle(
                                color: greyColor,
                                fontSize: 14,
                              ),
                              contentPadding: const EdgeInsets.all(15),
                            )),
                      ),

                const SizedBox(
                  height: 10,
                ),

                     Column(
                        children: [
                          InkWell(
                            onTap: () {
                              // ignore: void_checks
                              return commonBottomsheet(
                                  context, bedroomList, _bedroomController);
                            },
                            child: TextFormField(
                                focusNode: _bedroomNode,
                                controller: _bedroomController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please choose your bedroom';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                enabled: false,
                                decoration: InputDecoration(
                                  labelText: 'Bedroom*',
                                  errorStyle: const TextStyle(
                                      color: Colors.red, fontSize: 10),
                                  labelStyle: TextStyle(
                                    color: greyColor,
                                    fontSize: 14,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: blackColor,
                                    size: 30,
                                  ),
                                  hintText: 'Enter your bedroom',
                                  hintStyle: TextStyle(
                                    color: greyColor,
                                    fontSize: 14,
                                  ),
                                  contentPadding: const EdgeInsets.all(15),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              // ignore: void_checks
                              return commonBottomsheet(
                                  context, bathroomList, _bathroomController);
                            },
                            child: TextFormField(
                                focusNode: _bathroomNode,
                                controller: _bathroomController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please choose your bathroom';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                enabled: false,
                                decoration: InputDecoration(
                                  labelText: 'Bathroom*',
                                  errorStyle: const TextStyle(
                                      color: Colors.red, fontSize: 10),
                                  labelStyle: TextStyle(
                                    color: greyColor,
                                    fontSize: 14,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: blackColor,
                                    size: 30,
                                  ),
                                  hintText: 'Enter your bathroom',
                                  hintStyle: TextStyle(
                                    color: greyColor,
                                    fontSize: 14,
                                  ),
                                  contentPadding: const EdgeInsets.all(15),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              return commonBottomsheet(
                                  context, furnishList, _furnishController);
                            },
                            child: TextFormField(
                                focusNode: _furnishNode,
                                controller: _furnishController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please choose your furnish type';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                enabled: false,
                                decoration: InputDecoration(
                                  labelText: 'Furnishing*',
                                  errorStyle: const TextStyle(
                                      color: Colors.red, fontSize: 10),
                                  labelStyle: TextStyle(
                                    color: greyColor,
                                    fontSize: 14,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: blackColor,
                                    size: 30,
                                  ),
                                  hintText: 'Enter your furnish type',
                                  hintStyle: TextStyle(
                                    color: greyColor,
                                    fontSize: 14,
                                  ),
                                  contentPadding: const EdgeInsets.all(15),
                                )),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              return commonBottomsheet(context,
                                  constructionList, _constructionController);
                            },
                            child: TextFormField(
                                focusNode: _constructionNode,
                                controller: _constructionController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please choose your construction status';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.name,
                                enabled: false,
                                decoration: InputDecoration(
                                  labelText: 'Construction Status*',
                                  errorStyle: const TextStyle(
                                      color: Colors.red, fontSize: 10),
                                  labelStyle: TextStyle(
                                    color: greyColor,
                                    fontSize: 14,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    color: blackColor,
                                    size: 30,
                                  ),
                                  hintText: 'Enter your Construction status',
                                  hintStyle: TextStyle(
                                    color: greyColor,
                                    fontSize: 14,
                                  ),
                                  contentPadding: const EdgeInsets.all(15),
                                )),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                              controller: _sqftController,
                              focusNode: _sqftNode,
                              validator: (value) {
                                return checkNullEmptyValidation(value, 'sqft');
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Sqft*',
                                labelStyle: TextStyle(
                                  color: greyColor,
                                  fontSize: 14,
                                ),
                                errorStyle: const TextStyle(
                                    color: Colors.red, fontSize: 10),
                                contentPadding: const EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: disabledColor)),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                              controller: _floorsController,
                              focusNode: _floorsNode,
                              validator: (value) {
                                return checkNullEmptyValidation(
                                    value, 'floors');
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                labelText: 'Floors*',
                                labelStyle: TextStyle(
                                  color: greyColor,
                                  fontSize: 14,
                                ),
                                errorStyle: const TextStyle(
                                    color: Colors.red, fontSize: 10),
                                contentPadding: const EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide:
                                        BorderSide(color: disabledColor)),
                              )),
                        ],
                      ),

                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: _titleController,
                    focusNode: _titleNode,
                    maxLength: 50,
                    validator: (value) {
                      return checkNullEmptyValidation(value, 'title');
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Title*',
                      counterText:
                          'Mention the key features, i.e Brand, Model, Type',
                      labelStyle: TextStyle(
                        color: greyColor,
                        fontSize: 14,
                      ),
                      errorStyle:
                          const TextStyle(color: Colors.red, fontSize: 10),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: disabledColor)),
                    )),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: _descriptionController,
                    focusNode: _descriptionNode,
                    maxLength: 50,
                    validator: (value) {
                      return checkNullEmptyValidation(
                          value, 'product description');
                    },
                    maxLines: 3,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Description*',
                      counterText: '',
                      labelStyle: TextStyle(
                        color: greyColor,
                        fontSize: 14,
                      ),
                      errorStyle:
                          const TextStyle(color: Colors.red, fontSize: 10),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: disabledColor)),
                    )),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: _priceController,
                    focusNode: _priceNode,
                    validator: (value) {
                      return validatePrice(value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefix: const Text('\$ '),
                      labelText: 'Price*',
                      labelStyle: TextStyle(
                        color: greyColor,
                        fontSize: 14,
                      ),
                      errorStyle:
                          const TextStyle(color: Colors.red, fontSize: 10),
                      contentPadding: const EdgeInsets.all(15),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(color: disabledColor)),
                    )),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    if (kDebugMode) {

                    }
                    return openBottomSheet(
                        context: context, child: const ImagePickerWidget());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      color: Colors.grey[300],
                    ),
                    child: Text(
                      'Upload More Images'
                          ,
                      style: TextStyle(
                          color: blackColor, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GalleryImage(
                        titleGallery: 'Uploaded Images',
                        numOfShowImages:
                        data.length,
                        imageUrls: [''])

              ],
            ),
          ),
        ),
      ),
    );
  }
}
