import 'dart:async';

import 'package:middle_east_haraje/constants/colors.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:like_button/like_button.dart';
import 'package:map_launcher/map_launcher.dart' as launcher;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductDetail extends StatefulWidget {
  static const screenId = 'product_details_screen';
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late GoogleMapController _mapController;

  bool _loading = true;
  int _index = 0;
  bool isLiked = false;
  List fav = [];
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      setState(() {
        _loading = false;
      });
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  _mapLauncher(location) async {
    final availableMaps = await launcher.MapLauncher.installedMaps;
    await availableMaps.first.showMarker(
      coords: launcher.Coords(location.latitude, location.longitude),
      title: "Seller Location is here..",
    );
  }

  Future<void> _callLauncher(number) async {
    if (!await launchUrl(number)) {
      throw 'Could not launch $number';
    }
  }

  _body({
    required Map data,
    required String formattedDate,
    required String formattedPrice,
    required NumberFormat numberFormat,
  }) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 450,
                        color: Colors.transparent,
                        child: _loading
                            ? Center(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircularProgressIndicator(
                                      color: secondaryColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Loading..',
                                    )
                                  ],
                                ),
                              )
                            : Stack(
                                children: [
                                  Center(
                                    child: Image.network(
                                      'https://thumbs.dreamstime.com/b/yellow-colored-rose-phote-yellow-colored-rose-118258439.jpg',
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      height: 60,
                                      color: whiteColor,
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ListView.builder(
                                            physics: const ScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 3,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    _index = index;
                                                  });
                                                },
                                                child: Container(
                                                  width: 100,
                                                  color: whiteColor,
                                                  child: Image.network(
                                                      'https://thumbs.dreamstime.com/b/yellow-colored-rose-phote-yellow-colored-rose-118258439.jpg'),
                                                ),
                                              );
                                            }),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                      ),
                      _loading
                          ? Container()
                          : Container(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'phone',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        if (data['category'] == 'Cars')
                                          Text('[${data['year']}]'),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Text('12'),
                                                SizedBox(width: 3,),
                                                Icon(Icons.visibility),
                                              ],
                                            ),
                                            Text(
                                              ' $formattedDate',
                                              style: TextStyle(
                                                color: blackColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      '\$ $formattedPrice',
                                      style: const TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Icon(
                                          Icons.location_pin,
                                          color: Colors.red,
                                          size: 25,
                                        ),
                                        Text(
                                          ' Tala',
                                          style: TextStyle(
                                            color: blackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (data['category'] == 'Cars')
                                      Container(
                                        decoration: BoxDecoration(
                                            color:
                                                disabledColor.withOpacity(0.3),
                                            border: Border.all(
                                                color: blackColor
                                                    .withOpacity(0.3))),
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .filter_alt_outlined,
                                                        color: blackColor,
                                                        size: 12,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        data['fuel_type'],
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons.av_timer_outlined,
                                                        color: blackColor,
                                                        size: 12,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        '${numberFormat.format(int.parse(data['km_driven']))} Km',
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .account_tree_outlined,
                                                        color: blackColor,
                                                        size: 12,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        data[
                                                            'transmission_type'],
                                                        style: const TextStyle(
                                                          fontSize: 12,
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                              Divider(
                                                color: blackColor,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Icon(
                                                          Icons.person,
                                                          color: blackColor,
                                                          size: 12,
                                                        ),
                                                        const SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(
                                                          '${data['owners']} Owner',
                                                          style:
                                                              const TextStyle(
                                                            fontSize: 12,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        child: TextButton.icon(
                                                            onPressed: () {},
                                                            icon: Icon(
                                                              Icons
                                                                  .location_on_outlined,
                                                              size: 12,
                                                              color: blackColor,
                                                            ),
                                                            label: const Text(
                                                              'tala Eg',
                                                              style:
                                                                  TextStyle(),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                            )),
                                                      ),
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                            'Posted At'),
                                                        Text(formattedDate
                                                            .toString()),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'Ad Descreption',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                    'All the mobile phones we sell are all brand new , original factory unlocked and it comes with full accessories and one year manufacturers warranty. We sell in bulk / unit and discount on price for purchases which are more than one.'),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 15,
                                                    vertical: 10,
                                                  ),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  color: disabledColor
                                                      .withOpacity(0.3),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      if (data['subcategory'] ==
                                                              'Mobile Phones' ||
                                                          data['subcategory'] ==
                                                              null)
                                                        Text(
                                                          'Brand: ${data['brand']}',
                                                          style: TextStyle(
                                                            color: blackColor,
                                                          ),
                                                        ),
                                                      (data['subcategory'] ==
                                                                  'Accessories' ||
                                                              data['subcategory'] ==
                                                                  'Tablets' ||
                                                              data['subcategory'] ==
                                                                  'For Sale: House & Apartments' ||
                                                              data['subcategory'] ==
                                                                  'For Rent: House & Apartments')
                                                          ? Text(
                                                              'Type: ${data['type']}',
                                                              style: TextStyle(
                                                                color:
                                                                    blackColor,
                                                              ),
                                                            )
                                                          : const SizedBox(),
                                                      (data['subcategory'] ==
                                                                  'For Sale: House & Apartments' ||
                                                              data['subcategory'] ==
                                                                  'For Rent: House & Apartments')
                                                          ? Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  'Bedrooms: ${data['bedroom']}',
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        blackColor,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Bathrooms: ${data['bathroom']}',
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        blackColor,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Furnished Type: ${data['furnishing']}',
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        blackColor,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Construction Status: ${data['construction_status']}',
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        blackColor,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'Floors: ${data['floors']}',
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        blackColor,
                                                                  ),
                                                                ),
                                                                const SizedBox(
                                                                    height: 20),
                                                              ],
                                                            )
                                                          : const SizedBox(),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      color: blackColor,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
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
                                          child: ListTile(
                                            title: const Text(
                                              'iphone',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                            subtitle: Text(
                                              'View Profile',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: linkColor,
                                              ),
                                            ),
                                            trailing: IconButton(
                                                onPressed: () {},
                                                icon: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: linkColor,
                                                  size: 12,
                                                )),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    Divider(
                                      color: blackColor,
                                    ),

                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 200,
                                      color: disabledColor.withOpacity(0.3),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: GoogleMap(
                                              initialCameraPosition:
                                                  const CameraPosition(
                                                zoom: 15,
                                                target: LatLng(
                                                  30.790688360889437,
                                                  30.999950375407934,
                                                ),
                                              ),
                                              mapType: MapType.normal,
                                              onMapCreated: (GoogleMapController
                                                  controller) {
                                                setState(() {
                                                  _mapController = controller;
                                                });
                                              },
                                            ),
                                          ),
                                          const Center(
                                              child: Icon(
                                            Icons.location_pin,
                                            color: Colors.red,
                                            size: 35,
                                          )),
                                          Center(
                                            child: CircleAvatar(
                                              radius: 60,
                                              backgroundColor:
                                                  blackColor.withOpacity(0.1),
                                            ),
                                          ),
                                          Positioned(
                                            right: 4,
                                            top: 4,
                                            child: Material(
                                              elevation: 4,
                                              shape: Border.all(
                                                  color: disabledColor
                                                      .withOpacity(0.2)),
                                              child: IconButton(
                                                icon: const Icon(
                                                  Icons.alt_route_outlined,
                                                ),
                                                onPressed: () async {},
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Ad Id: ${data['posted_at']}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: () {},
                                          child: Text(
                                            'REPORT AD',
                                            style: TextStyle(color: linkColor),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 80,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _bottomSheet() {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(children: [
          Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(secondaryColor)),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.chat_bubble,
                        size: 16,
                        color: whiteColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Chat',style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                )),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(secondaryColor)),
                onPressed: () async {
                  var phoneNo = Uri.parse('tel:010000000000');
                  await _callLauncher(phoneNo);
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.call,
                        size: 16,
                        color: whiteColor,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Call',style: TextStyle(color: Colors.white)
                      )
                    ],
                  ),
                )),
          )
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('##,##,##0');
    var data = {};
    var _price = int.parse('123');
    var formattedPrice = numberFormat.format(_price);
    var date = DateTime.fromMicrosecondsSinceEpoch(132);
    var formattedDate = DateFormat.yMMMd().format(date);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: whiteColor,
          elevation: 0,
          iconTheme: IconThemeData(color: blackColor),
          title: Text(
            'Product Details',
            style: TextStyle(color: blackColor),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.share_outlined,
                color: blackColor,
              ),
              onPressed: () {},
            ),
            IconButton(
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                  });
                },
                color: isLiked ? secondaryColor : disabledColor,
                icon: Icon(
                  isLiked ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                ))
          ],
        ),
        body: _body(
          data: data,
          formattedDate: formattedDate,
          formattedPrice: formattedPrice,
          numberFormat: numberFormat,
        ),
        bottomSheet: _loading ? const SizedBox() : _bottomSheet());
  }
}
