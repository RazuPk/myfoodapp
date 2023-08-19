import 'package:flutter/material.dart';
import '../../screens/sellers_screens/home_screen.dart';
import '../../screens/sellers_screens/order_screen.dart';
import '../../screens/sellers_screens/products_screen.dart';
import '../../utils/style.dart';
import '../../utils/app_colors.dart';


class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  int _selectedScreen = 0;
  List<Widget> _screen = [
    HomeScreen(),
    ProductsScreen(),
    OrderScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.cyan,
                Colors.amber,
              ],
              begin: FractionalOffset(0.0 , 0.0),
              end: FractionalOffset(1.0 , 0.0),
              stops: [0.0 , 1.0],
              tileMode: TileMode.clamp,
            )
          ),
        ),
        title: Text("MyFood",style: titleStyle,),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          setState(() {
            _selectedScreen = value;
          });
        },
        elevation: 5,
        currentIndex: _selectedScreen,
        selectedItemColor: primaryColor,
        unselectedItemColor: greyColor,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: "Products"),
          BottomNavigationBarItem(icon: Icon(Icons.add_shopping_cart_outlined), label: "Cart"),
        ],
      ),
      body: _screen[_selectedScreen],
    );
  }
}
