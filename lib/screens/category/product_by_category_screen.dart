import 'package:middle_east_haraje/components/product_listing_widget.dart';
import 'package:middle_east_haraje/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductByCategory extends StatelessWidget {
  static const String screenId = 'product_by_category';
  const ProductByCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: whiteColor,
          iconTheme: IconThemeData(
            color: blackColor,
          ),
          title: Text(
            'Cars'
               ,
            style: TextStyle(
              color: blackColor,
            ),
          ),
        ),
        body: const SingleChildScrollView(
            child: ProductListing(
          isProductByCategory: true,
        )));
  }
}
