import 'package:flutter/material.dart';
import '../../utils/style.dart';
import '../../widgets/category_product_card_widget.dart';
import '../../widgets/flexible_space_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.cateName});

  final String cateName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceWidget(),
        title: Text(
          cateName,
          style: titleStyle,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            itemCount: 17,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.8),
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
            ),
            itemBuilder: (buildContext, index) {
              return CategoryProductCardWidget(imageUrl: 'images/omlet.png', title: 'Special Omlet', price: '150', rating: '4.9',);
            }),
      ),
    );
  }
}

