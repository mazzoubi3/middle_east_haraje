import 'dart:ui';

import 'package:middle_east_haraje/screens/category/category_widget.dart';
import 'package:middle_east_haraje/components/main_appbar_with_search.dart';
import 'package:middle_east_haraje/components/product_listing_widget.dart';
import 'package:middle_east_haraje/constants/colors.dart';
import 'package:middle_east_haraje/screens/location_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String screenId = 'home_screen';
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController searchController;
  late CarouselController _controller;
  int _current = 0;
  late FocusNode searchNode;

  Future<List<String>> downloadBannerImageUrlList() async {
    List<String> bannerUrlList = [];

    return bannerUrlList;
  }

  @override
  void initState() {
    searchController = TextEditingController();
    searchNode = FocusNode();
    _controller = CarouselController();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    searchNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: MainAppBarWithSearch(
            controller: searchController, focusNode: searchNode),
      ),
      body: homeBodyWidget(),
    );
  }

  lcoationAutoFetchBar(BuildContext context) {
   return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Icon(
          Icons.location_pin,
          color: Color(0xff5D95E0),
          size: 25,
        ),
        Text(
          ' Tala',
          style: TextStyle(
            color: blackColor,
            fontSize: 16,
            fontWeight: FontWeight.w600
          ),
        ),
        const Icon(
          Icons.keyboard_arrow_down,
          color: Color(0xff5D95E0),
          size: 25,
        ),
      ],
    );

  }

  Widget homeBodyWidget() {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              height: 40,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(LocationScreen.screenId);
                },
                child: Center(child:

                lcoationAutoFetchBar(context)),
              ),
            ),
            Column(
              children: [
                const CategoryWidget(),
                FutureBuilder(
                  future: downloadBannerImageUrlList(),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<String>> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SizedBox(
                        height: 250,
                        child: Center(
                            child: CircularProgressIndicator(
                          color: secondaryColor,
                        )),
                      );
                    } else {
                      if (snapshot.hasError) {
                        return const Text(
                            'Currently facing issue in banner loading');
                      } else {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: CarouselSlider.builder(
                            itemCount: 3,
                            options: CarouselOptions(
                              autoPlay: true,
                              viewportFraction: 1.0,
                            ),
                            itemBuilder: (context, index, realIdx) {
                              return ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                                child: CachedNetworkImage(
                                  imageUrl: 'https://darelhilal.com/Media/News/2021/4/22/2021-637546503273772094-377.jpg',

                                ),
                              );
                            },
                          ),
                        );
                      }
                    }
                  },
                ),
              ],
            ),
            const ProductListing()
          ],
        ),
      ),
    );
  }
}

class locationTextWidget extends StatelessWidget {
  final String? location;
  const locationTextWidget({Key? key, required this.location})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.pin_drop,
          size: 18,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          location ?? '',
          style: TextStyle(
            color: blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
