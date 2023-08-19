import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
class HomeCarouselSliderWidget extends StatelessWidget {
  HomeCarouselSliderWidget({super.key, required this.images,});

  final ValueNotifier<int> _currentCarouselIndex = ValueNotifier(0);
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180.0,
            viewportFraction: 1,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 2),
            onPageChanged: (index,_){
              _currentCarouselIndex.value=index;
            },
            scrollDirection: Axis.horizontal,
          ),
          items: images.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 2.0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage(imageUrl),
                          fit: BoxFit.fitWidth
                        ),
                    ),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 8,),
        ValueListenableBuilder(
            valueListenable: _currentCarouselIndex,
            builder: (context, currentValue, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for(int i=0; i<images.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: currentValue == i ? primaryColor : null,
                          border: Border.all(color: greyColor.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    )
                ],
              );
            }
        )
      ],
    );
  }
}
