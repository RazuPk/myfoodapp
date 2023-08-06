import 'package:flutter/material.dart';
class SellersDashboardScreen extends StatelessWidget {
  const SellersDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.amber,
                Colors.cyan
              ],
              begin: FractionalOffset(0.0,0.0),
              end: FractionalOffset(1.0,0.0),
              stops: [0.0 , 0.1],
              tileMode: TileMode.clamp
            )
          ),
        ),
      ),
    );
  }
}
