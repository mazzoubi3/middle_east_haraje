import 'package:middle_east_haraje/constants/colors.dart';

import 'package:middle_east_haraje/screens/product/product_card.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductListing extends StatefulWidget {
  final bool? isProductByCategory;

  const ProductListing({Key? key, this.isProductByCategory}) : super(key: key);

  @override
  State<ProductListing> createState() => _ProductListingState();
}

class _ProductListingState extends State<ProductListing> {
List data=[
  {
    'images':'https://thumbs.dreamstime.com/b/yellow-colored-rose-phote-yellow-colored-rose-118258439.jpg',
    'price':'123',
    'title':'phone',
    'category':'???'
  },
  {
    'images':'https://thumbs.dreamstime.com/b/yellow-colored-rose-phote-yellow-colored-rose-118258439.jpg',
    'price':'123',
    'title':'phone',
    'category':'???'
  },
  {
    'images':'https://thumbs.dreamstime.com/b/yellow-colored-rose-phote-yellow-colored-rose-118258439.jpg',
    'price':'123',
    'title':'phone',
    'category':'???'
  },
  {
    'images':'https://thumbs.dreamstime.com/b/yellow-colored-rose-phote-yellow-colored-rose-118258439.jpg',
    'price':'123',
    'title':'phone',
    'category':'???'
  },
];
  @override
  Widget build(BuildContext context) {

    final numberFormat = NumberFormat('##,##,##0');
    return  Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (widget.isProductByCategory != null)
              ? const SizedBox()
              : Container(
            child: Column(
              children: [
                Text(
                  'Recommendation',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: blackColor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          GridView.builder(
              physics: const ScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate:
              const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 2 / 2.8,
                mainAxisExtent: 250,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
              ),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                print(data.length);
                var price = int.parse('123');
                String formattedPrice = numberFormat.format(price);
                return ProductCard(
                  data: data,
                  formattedPrice: formattedPrice,
                  numberFormat: numberFormat,
                );
              }),
        ],
      ),
    );
  }
}
