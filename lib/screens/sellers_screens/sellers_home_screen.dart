
import 'package:flutter/material.dart';
import '../../global/global.dart';
import '../../screens/authentication/auth_screen.dart';
import '../../widgets/flexible_space_widget.dart';
import '../../widgets/product_card_widget.dart';

class SellersHomeScreen extends StatefulWidget {
  const SellersHomeScreen({super.key});

  @override
  State<SellersHomeScreen> createState() => _SellersHomeScreenState();
}

class _SellersHomeScreenState extends State<SellersHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: FlexibleSpaceWidget(),
          title: Row(
            children: [
              Text(
                sharedPreferences!.getString("name")!,
                style: TextStyle(
                  fontFamily: "VarelaRound",
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.logout), iconSize: 32,
                onPressed: () {
                  firebaseAuth.signOut().then((value) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => AuthScreen()));
                  });
                },
              ),
            ],
          ),
          automaticallyImplyLeading: false,
        ),
        body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, childAspectRatio: 0.75,),
            itemCount: 16,
            itemBuilder: (context, index) {
              return ProductCardWidget(imageUrl: "images/vegetable.png", title: 'Chicken Burger', price: '140', ratings: '4.7',);
            })
    );
  }
}
