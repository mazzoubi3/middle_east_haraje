import 'package:get/get.dart';
import 'package:middle_east_haraje/forms/sell_car_form.dart';
import 'package:middle_east_haraje/screens/category/product_by_category_screen.dart';
import 'package:middle_east_haraje/screens/category/subcategory_screen.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CategoryListScreen extends StatelessWidget {
  final bool? isForForm;
  final List data=[
    {
      'category_name':'phone',
      'subcategory':'Iphone',

    },
    {
      'category_name':'phone',
      'subcategory':'Iphone',

    },
    {
      'category_name':'phone',
      'subcategory':'Iphone',

    },
    {
      'category_name':'phone',
      'subcategory':'Iphone',

    },
    {
      'category_name':'phone',
      'subcategory':'Iphone',

    },
  ];

  static const String screenId = 'category_list_screen';
   CategoryListScreen({Key? key, this.isForForm}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        iconTheme: IconThemeData(color: blackColor),
        title: Text(
          isForForm == true ? 'Select Category' : 'Categories',
          style: TextStyle(color: blackColor),
        ),
      ),
      body: _body(),
    );
  }

  _body() {

    return ListView.builder(
        itemCount:data.length,
        itemBuilder: ((context, index) {
          var doc =data[index];
          return Padding(
              padding: const EdgeInsets.all(8),
              child: ListTile(
                onTap: () {

                  if (isForForm == true) {
                    if (doc['subcategory'] == null) {
                      Get.to(const SellCarForm(),transition: Transition.fadeIn,duration:const Duration(seconds: 1) );
                      //
                      // Navigator.of(context)
                      //     .pushNamed(SellCarForm.screenId);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const SubCategoryScreen(
                                   isForForm: true)));
                    }
                  } else {
                    if (doc['subcategory'] == null) {
                      Navigator.of(context)
                          .pushNamed(ProductByCategory.screenId);
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const SubCategoryScreen(

                              )));
                    }
                  }
                },
                leading: Image.network('https://thumbs.dreamstime.com/b/yellow-colored-rose-phote-yellow-colored-rose-118258439.jpg'),
                title: Text(
                  doc['category_name'],
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
                trailing: doc['subcategory'] != null
                    ? const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                )
                    : null,
              ));
        }));
  }
}
