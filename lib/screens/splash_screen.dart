import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myfoodapp/screens/sellers_screens/bottom_navbar_screen.dart';
import '../global/global.dart';
import '../screens/sellers_screens/sellers_home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer(){
    Timer(const Duration(seconds: 1), () async{
      if(firebaseAuth.currentUser != null){
        Navigator.push(context, MaterialPageRoute(builder: (c)=>const SellersHomeScreen()));
      }else{
        Navigator.push(context, MaterialPageRoute(builder: (c)=> BottomNavBarScreen()));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('images/splash.jpg'),
              ),
              const SizedBox(height: 10,),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text('Seller App',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 40,
                  fontFamily: "Signatra",
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
