import 'package:flutter/material.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.ratings,
  });
  final String image,title, price, ratings;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 3,
        shadowColor: Colors.blueAccent,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                elevation: 4,
                shadowColor: Colors.amber,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset(image,
                  height: MediaQuery.of(context).size.height * 0.20,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 6,),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.blue),
                ),
              ),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("\$$price",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.blue),),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 1.0,
                    children: [
                      Text(ratings,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: Colors.amber),),
                      Icon(Icons.star,size: 16,color: Colors.amber,)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
