import 'package:middle_east_haraje/constants/colors.dart';
import 'package:middle_east_haraje/screens/product/product_card.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyPostScreen extends StatefulWidget {
  static const screenId = 'my_post_screen';
  const MyPostScreen({Key? key}) : super(key: key);

  @override
  State<MyPostScreen> createState() => _MyPostScreenState();
}

class _MyPostScreenState extends State<MyPostScreen> {

  List data=[];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          title: Text(
            'My Posts',
            style: TextStyle(color: blackColor),
          ),
          bottom: TabBar(indicatorColor: secondaryColor, tabs: [
            Tab(
              child: Text(
                'My Posts',
                style: TextStyle(color: blackColor),
              ),
            ),
            Tab(
              child: Text(
                'Favourites',
                style: TextStyle(color: blackColor),
              ),
            ),
          ]),
        ),
        body: bodyWidget(data),
      ),
    );
  }
}

bodyWidget(List data) {
  final numberFormat = NumberFormat('##,##,##0');
  return TabBarView(children: [
    Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate:
                const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2,
                  mainAxisExtent: 250,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                ),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  var price = int.parse(data[index]['price']);
                  String formattedPrice = numberFormat.format(price);
                  return ProductCard(
                    data: data,
                    formattedPrice: formattedPrice,
                    numberFormat: numberFormat,
                  );
                }),
          ),
        ],
      ),
    ),
    Container(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate:
                const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 2 / 2,
                  mainAxisExtent: 250,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 10,
                ),
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  var price = int.parse(data[index]['price']);
                  String formattedPrice = numberFormat.format(price);
                  return ProductCard(
                    data: data,
                    formattedPrice: formattedPrice,
                    numberFormat: numberFormat,
                  );
                }),
          ),
        ],
      ),
    ),
  ]);
}
