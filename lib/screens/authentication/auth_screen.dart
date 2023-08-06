import 'package:flutter/material.dart';
import '../../screens/authentication/register_screen.dart';

import '../../widgets/flexible_space_widget.dart';
import 'login_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar:AppBar(
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
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.lock, color: Colors.white,),
                text: 'Login',
              ),
              Tab(
                icon: Icon(Icons.person, color: Colors.white,),
                text: 'Register',
              )
            ],
            indicatorColor: Colors.white54,
            indicatorWeight: 6,
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Colors.amber,
                Colors.cyan,
              ]
            )
          ),
          child: const TabBarView(
            children: [
              LoginScreen(),
              RegisterScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
