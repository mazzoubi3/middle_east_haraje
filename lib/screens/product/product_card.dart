import 'package:get/get.dart';
import 'package:middle_east_haraje/constants/colors.dart';
import 'package:middle_east_haraje/screens/product/product_details_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.data,
    required this.formattedPrice,
    required this.numberFormat,
  }) : super(key: key);

  final List data;
  final String formattedPrice;
  final NumberFormat numberFormat;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  String address = 'tala';
  bool isLiked = false;
  List fav = [];
  @override
  void initState() {

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(ProductDetail(),transition: Transition.fadeIn,duration: Duration(seconds: 2));

      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.black,width: 2
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      alignment: Alignment.center,
                      height: 120,
                      child: Image.network(
                        widget.data[0]['images'],
                        fit: BoxFit.cover,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$ ${widget.formattedPrice}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    widget.data[0]['title'],
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  (widget.data[0]['category'] == 'Cars')
                      ? Text(
                          '${widget.data[0]['year']} - ${widget.numberFormat.format(int.parse(widget.data[0]['km_driven']))} Km')
                      : const SizedBox(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.location_pin,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Flexible(
                        child: Text(
                          address,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    '1/11/1111',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const Text(
                    '15.03',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),

                ],
              ),
              Positioned(
                  right: 0,
                  bottom: 65,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          isLiked = !isLiked;
                        });

                      },
                      color: isLiked ? secondaryColor : disabledColor,
                      icon: Icon(
                        isLiked
                            ? CupertinoIcons.bookmark_fill
                            : CupertinoIcons.bookmark,
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
