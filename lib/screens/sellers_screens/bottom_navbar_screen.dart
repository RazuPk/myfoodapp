import 'package:flutter/material.dart';
import '../../screens/sellers_screens/home_screen.dart';
import '../../screens/sellers_screens/order_screen.dart';
import '../../screens/sellers_screens/products_screen.dart';

import '../../widgets/flexible_space_widget.dart';

class BottomNavBarScreen extends StatefulWidget {
  const BottomNavBarScreen({super.key});

  @override
  State<BottomNavBarScreen> createState() => _BottomNavBarScreenState();
}

class _BottomNavBarScreenState extends State<BottomNavBarScreen> {
  final List<Widget> _screen = [
    HomeScreen(),
    ProductsScreen(),
    OrderScreen(),
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: FlexibleSpaceWidget(),
        title:const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4,vertical: 8),
          child: Text('myFood',
              style:TextStyle(
                fontSize: 40,
                color: Colors.white,
                fontFamily: "Labester",
              )),
        ),
      ),
      body: _screen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value){
          _selectedIndex = value;
          if (mounted) {
            setState(() {});
          }
        },
        elevation: 4,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_outlined),
            label: "Orders",
          ),
        ],
      ),
    );
  }
}
