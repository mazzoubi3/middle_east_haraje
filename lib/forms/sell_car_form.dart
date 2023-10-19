import 'package:middle_east_haraje/components/bottom_nav_widget.dart';
import 'package:middle_east_haraje/constants/colors.dart';
import 'package:middle_east_haraje/constants/widgets.dart';
import 'package:middle_east_haraje/forms/user_form_review.dart';

import 'package:flutter/material.dart';
import 'package:galleryimage/galleryimage.dart';
import 'package:provider/provider.dart';

import '../components/image_picker_widget.dart';
import '../constants/validators.dart';

class SellCarForm extends StatefulWidget {
  static const screenId = 'sell_car_form';

  const SellCarForm({Key? key}) : super(key: key);

  @override
  State<SellCarForm> createState() => _SellCarFormState();
}

class _SellCarFormState extends State<SellCarForm> {
  late TextEditingController _carModelNameController;
  late TextEditingController _yearController;
  late TextEditingController _priceController;
  late TextEditingController _fuelController;
  late TextEditingController _transmissionController;
  late TextEditingController _kmDrivenController;
  late TextEditingController _ownerController;
  late TextEditingController _titleController;
  late TextEditingController _descController;
  late FocusNode _carModelNameNode;
  late FocusNode _yearNode;
  late FocusNode _priceNode;
  late FocusNode _fuelNode;
  late FocusNode _transmissionNode;
  late FocusNode _kmDrivenNode;
  late FocusNode _ownerNode;
  late FocusNode _titleNode;
  late FocusNode _descNode;
  final _formKey = GlobalKey<FormState>();
List data=[];
  @override
  void initState() {
    _carModelNameController = TextEditingController();
    _yearController = TextEditingController();
    _priceController = TextEditingController();
    _fuelController = TextEditingController();
    _transmissionController = TextEditingController();
    _kmDrivenController = TextEditingController();
    _ownerController = TextEditingController();
    _titleController = TextEditingController();
    _descController = TextEditingController();
    _carModelNameNode = FocusNode();
    _yearNode = FocusNode();
    _priceNode = FocusNode();
    _fuelNode = FocusNode();
    _transmissionNode = FocusNode();
    _kmDrivenNode = FocusNode();
    _ownerNode = FocusNode();
    _titleNode = FocusNode();
    _descNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _carModelNameController.dispose();
    _yearController.dispose();
    _priceController.dispose();
    _fuelController.dispose();
    _transmissionController.dispose();
    _kmDrivenController.dispose();
    _ownerController.dispose();
    _titleController.dispose();
    _descController.dispose();
    _carModelNameNode.dispose();
    _yearNode.dispose();
    _priceNode.dispose();
    _fuelNode.dispose();
    _transmissionNode.dispose();
    _kmDrivenNode.dispose();
    _ownerNode.dispose();
    _titleNode.dispose();
    _descNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // it is used to get context
    super.didChangeDependencies();
  }

  final List<String> _fuelType = ['Diesel', 'Petrol', 'Electric', 'LPG'];
  final List<String> _transmissionType = ['Automatic', 'Manual'];
  final List<String> _noOfOwner = ['1st', '2nd', '3rd', '4th', '4th+'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          iconTheme: IconThemeData(color: blackColor),
          title: Text(
            'Add Car Details',
            style: TextStyle(color: blackColor),
          )),
      body: sellCarFormWidget(),
      bottomNavigationBar: BottomNavigationWidget(
        buttonText: 'Next',
        validator: true,
        onPressed: () async {

        },
      ),
    );
  }

  _fuelTypeListView(BuildContext context) {
    return openBottomSheet(
        context: context,
        appBarTitle: 'Select Fuel Type',
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _fuelType.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  setState(() {
                    _fuelController.text = _fuelType[index];
                  });
                  Navigator.pop(context);
                },
                title: Text(_fuelType[index]),
              );
            }));
  }

  _transmissionTypeListView(BuildContext context) {
    return openBottomSheet(
        context: context,
        appBarTitle: 'Select Transmission Type',
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _transmissionType.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  setState(() {
                    _transmissionController.text = _transmissionType[index];
                  });
                  Navigator.pop(context);
                },
                title: Text(_transmissionType[index]),
              );
            }));
  }

  _ownerListView(BuildContext context) {
    return openBottomSheet(
        context: context,
        appBarTitle: 'Select No. Of Owners',
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: _noOfOwner.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {
                  setState(() {
                    _ownerController.text = _noOfOwner[index];
                  });
                  Navigator.pop(context);
                },
                title: Text(_noOfOwner[index]),
              );
            }));
  }

  _getCarModelList(BuildContext context,) {
    return openBottomSheet(
      context: context,
      appBarTitle: 'Select Car Model',
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {

                Navigator.pop(context);
              },
              title: Text(data[index]),
            );
          }),
    );
  }

  sellCarFormWidget() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Car Details',
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
                  onTap: () => _getCarModelList(context),
                  child: TextFormField(
                      focusNode: _carModelNameNode,
                      controller: _carModelNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please choose a car model';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: 'Model Name',
                        errorStyle:
                            const TextStyle(color: Colors.red, fontSize: 10),
                        labelStyle: TextStyle(
                          color: greyColor,
                          fontSize: 14,
                        ),
                        suffixIcon: Icon(
                          Icons.arrow_drop_down_sharp,
                          color: blackColor,
                          size: 30,
                        ),
                        hintText: 'Enter your car model variant',
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
                    _fuelTypeListView(context);
                  },
                  child: TextFormField(
                    controller: _fuelController,
                    focusNode: _fuelNode,
                    enabled: false,
                    validator: (value) {
                      return checkNullEmptyValidation(value, 'fuel type');
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 30,
                        color: blackColor,
                      ),
                      labelText: 'Fuel Type',
                      errorStyle:
                          const TextStyle(color: Colors.red, fontSize: 10),
                      labelStyle: TextStyle(
                        color: greyColor,
                        fontSize: 14,
                      ),
                      contentPadding: const EdgeInsets.all(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    _transmissionTypeListView(context);
                  },
                  child: TextFormField(
                    controller: _transmissionController,
                    focusNode: _transmissionNode,
                    enabled: false,
                    validator: (value) {
                      return checkNullEmptyValidation(
                          value, 'transmission type ');
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 30,
                        color: blackColor,
                      ),
                      labelText: 'Transmission Type',
                      errorStyle:
                          const TextStyle(color: Colors.red, fontSize: 10),
                      labelStyle: TextStyle(
                        color: greyColor,
                        fontSize: 14,
                      ),
                      contentPadding: const EdgeInsets.all(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    _ownerListView(context);
                  },
                  child: TextFormField(
                    controller: _ownerController,
                    focusNode: _ownerNode,
                    enabled: false,
                    validator: (value) {
                      return checkNullEmptyValidation(value, 'no. of owners ');
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 30,
                        color: blackColor,
                      ),
                      labelText: 'No. Of Owners',
                      errorStyle:
                          const TextStyle(color: Colors.red, fontSize: 10),
                      labelStyle: TextStyle(
                        color: greyColor,
                        fontSize: 14,
                      ),
                      contentPadding: const EdgeInsets.all(15),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: _yearController,
                    focusNode: _yearNode,
                    validator: (value) {
                      return validateYear(value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: 'Purchase Year',
                        labelStyle: TextStyle(
                          color: greyColor,
                          fontSize: 14,
                        ),
                        errorStyle:
                            const TextStyle(color: Colors.red, fontSize: 10),
                        hintText: 'Enter your car purchase year',
                        hintStyle: TextStyle(
                          color: greyColor,
                          fontSize: 14,
                        ),
                        contentPadding: const EdgeInsets.all(15),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: disabledColor)))),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    controller: _priceController,
                    focusNode: _priceNode,
                    validator: (value) {
                      return validatePrice(value);
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefix: const Text('₹ '),
                      labelText: 'Car Price',
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
                    controller: _kmDrivenController,
                    focusNode: _kmDrivenNode,
                    validator: (value) {
                      return checkNullEmptyValidation(
                          value, 'Kilometer driven');
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Kilometer Driven',
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
                    controller: _titleController,
                    focusNode: _titleNode,
                    maxLength: 50,
                    validator: (value) {
                      return checkNullEmptyValidation(value, 'title');
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Title',
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
                    controller: _descController,
                    focusNode: _descNode,
                    maxLines: 3,
                    validator: (value) {
                      return checkNullEmptyValidation(
                          value, 'car\'s description');
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Description*',
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
                        imageUrls:[''])

              ],
            ),
          ),
        ),
      ),
    );
  }
}
