import 'package:flutter/material.dart';

import '../screens/sellers_screens/category_screen.dart';
import '../utils/app_colors.dart';
class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({
    super.key, required this.imageUrl, required this.name,
  });
  final String imageUrl,name;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryScreen(cateName:name)));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 120,
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imageUrl,
                  width: MediaQuery.of(context).size.width,
                  height: 70,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(height: 8,),
            Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: primaryColor,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
