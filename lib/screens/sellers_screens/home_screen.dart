import 'package:flutter/material.dart';
import '../../widgets/category_card_widget.dart';
import '../../widgets/home_carousel_slider_widget.dart';
import '../../widgets/product_card_widget.dart';
import '../../widgets/remarks_title_widget.dart';
import '../../widgets/search_text_field_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<String> _images = [
    'images/banner01.png',
    'images/banner02.png',
    'images/banner03.png',
    'images/banner04.png',
    'images/banner05.png',
  ];

  final List<String> _products = [
    'images/chicken_burger.png',
    'images/omlet.png',
    'images/vegetable.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextFieldWidget(),
            SizedBox(
              height: 6,
            ),
            HomeCarouselSliderWidget(images: _images),
            SizedBox(
              height: 8,
            ),
            RemarksTitleWidget(
              remarksTitle: 'Categories',
              onTap: () {},
            ),
            SizedBox(
              height: 6,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _products.map((categories) => CategoryCardWidget(imageUrl: categories, name: 'Special')).toList(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            RemarksTitleWidget(remarksTitle: 'New', onTap: () {}),
            SizedBox(height: 8,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _products.map((products) => ProductCardWidget(imageUrl: products, title: 'Vegetable Soup', price: '250', ratings: '4.9',)).toList(),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            RemarksTitleWidget(remarksTitle: 'Hot Deals', onTap: (){}),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _products.map((products)=> ProductCardWidget(imageUrl: products, title: 'Beef Vuna', price: '780', ratings: '4.8')).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

