import 'package:flutter/material.dart';
import 'package:myfoodapp/global/global.dart';
import 'package:myfoodapp/screens/authentication/auth_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.cyan,
                  Colors.amber
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              )
          ),
        ),
        title: Text(
          sharedPreferences!.getString("name")!,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Logout"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.cyan
          ),
          onPressed: (){
            firebaseAuth.signOut().then((value){
              Navigator.push(context, MaterialPageRoute(builder: (c) => AuthScreen()));
            });
          },
        ),
      ),
    );
  }
}
