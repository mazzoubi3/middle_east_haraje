import 'package:get/get.dart';
import 'package:middle_east_haraje/forms/common_form.dart';
import 'package:middle_east_haraje/screens/category/product_by_category_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';

class SubCategoryScreen extends StatefulWidget {
  final bool? isForForm;
  static const String screenId = 'subcategory_screen';
  const SubCategoryScreen({Key? key,  this.isForForm})
      : super(key: key);

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  List data=[

    {
      'name':'kamel'
    },
    {
      'name':'kamel'
    },
    {
      'name':'kamel'
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: blackColor),
        backgroundColor: whiteColor,
        title: Text(
           'category_name',
          style: TextStyle(color: blackColor),
        ),
      ),
      body: _body( widget.isForForm),
    );
  }

  _body( bool? isForForm) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: ((context, index) {
          return Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                onTap: () {


                  if (isForForm == true) {
                    Get.to(CommonForm(),transition: Transition.fadeIn,duration:Duration(seconds: 1) );
                    // Navigator.pushNamed(context, CommonForm.screenId);
                  } else {
                    Get.to(ProductByCategory(),transition: Transition.fadeIn,duration:Duration(seconds: 1) );

                    // Navigator.pushNamed(
                    //   context,
                    //   ProductByCategory.screenId,
                    // );
                  }
                },
                title: Text(
                  data[index]['name'],
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ));
        }));
  }
}
