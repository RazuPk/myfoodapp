import 'package:flutter/material.dart';

import '../../widgets/app_text_field_widget.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                  'images/seller.png',
              height: 270,
              ),
            ),
          ),
          Form(
            key:_formKey,
            child: Column(
              children: [
                AppTextFieldWidget(
                  data: Icons.email,
                  controller: emailController,
                  hintText: 'Email',
                  isObscure: false,
                ),
                AppTextFieldWidget(
                  data: Icons.lock,
                  controller: passController,
                  hintText: 'Password',
                  isObscure: true,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: ()=>print('clicked'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding:const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            ),
            child: const Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          )
        ],
      ),
    );
  }
}
