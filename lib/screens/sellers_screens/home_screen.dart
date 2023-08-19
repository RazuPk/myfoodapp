import 'package:flutter/material.dart';
import '../../widgets/home_carousel_slider_widget.dart';
import '../../widgets/search_text_field_widget.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchTextFieldWidget(),
            SizedBox(height: 6,),
            HomeCarouselSliderWidget(images: ['images/banner01.png','images/banner02.png','images/banner03.png','images/banner04.png','images/banner05.png'],),
          ],
        ),
      ),
    );
  }
}


