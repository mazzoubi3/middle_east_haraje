import 'package:get/get.dart';
import 'package:middle_east_haraje/constants/colors.dart';
import 'package:middle_east_haraje/screens/category/category_list_screen.dart';
import 'package:middle_east_haraje/screens/category/product_by_category_screen.dart';
import 'package:flutter/material.dart';
import 'subcategory_screen.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: SizedBox(
          height: 120,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () =>
                    Get.to(CategoryListScreen(),transition: Transition.fadeIn,duration: const Duration(seconds: 2)),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          'See All',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: linkColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: linkColor,
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: ((context, index) {
                      var doc =data[index];
                      return InkWell(
                        onTap: () {

                          if (doc['subcategory'] == null) {
                            Navigator.of(context)
                                .pushNamed(ProductByCategory.screenId);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) =>
                                        const SubCategoryScreen()));
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(15)),
                            border:  Border.all(
                              color: Colors.black
                                  ,width: 2
                            )
                          ),
                          padding: const EdgeInsets.all(0),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              'https://thumbs.dreamstime.com/b/yellow-colored-rose-phote-yellow-colored-rose-118258439.jpg',

                            ),
                          ),
                        ),
                      );
                    })),
              )
            ],
          )),
    );
  }
}
