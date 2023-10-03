import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CategoryProductCardWidget extends StatelessWidget {
  const CategoryProductCardWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });

  final String title, imageUrl, price, rating;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 3,
        shadowColor: primaryColor.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Image.asset(imageUrl),
            ),
            SizedBox(
              height: 6,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: primaryColor,
                ),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '\$ $price',
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.w500),
                ),
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    Text(rating)
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
