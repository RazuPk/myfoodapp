import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../global/global.dart';
import '../../screens/sellers_screens/sellers_home_screen.dart';
import '../../widgets/error_dialog.dart';
import '../../widgets/loading_dialog.dart';

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

  formValidation(){
    if(emailController.text.isNotEmpty && passController.text.isNotEmpty){
      loginNow();
    }else{
      showDialog(
        context: context,
        builder: (c)
        {
          return ErrorDialog(
            message: "Please enter email/password",
          );
        }
      );
    }
  }

  loginNow() async{
    showDialog(
      context: context,
      builder: (c)
        {
          return LoadingDialog(
            message: "Checking Credentials",
          );
        }
    );
    User? currentUser;
    await firebaseAuth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
    ).then((auth){
      currentUser = auth.user!;
    }).catchError((error){
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c)
          {
            return ErrorDialog(
              message: error.message.toString(),
            );
      });
    });
    if(currentUser != null){
      readDataAndSetDataLocally(currentUser!).then((value){
      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (c) => SellersHomeScreen()));
});
    }
  }
  Future readDataAndSetDataLocally(User currentUser) async{
    await FirebaseFirestore.instance.collection("sellers")
        .doc(currentUser.uid)
        .get().then((snapshot) async{
      await sharedPreferences!.setString("uid", currentUser.uid);
      await sharedPreferences!.setString("email", snapshot.data()!["sellerEmail"]);
      await sharedPreferences!.setString("name", snapshot.data()!['sellerName']);
      await sharedPreferences!.setString("photoUrl", snapshot.data()!['sellerPhoto']);
    });
  }
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
                  textInputType: TextInputType.emailAddress,
                ),
                AppTextFieldWidget(
                  data: Icons.lock,
                  controller: passController,
                  hintText: 'Password',
                  isObscure: true,
                  textInputType: TextInputType.visiblePassword,
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding:const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            ),
            child: const Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
            onPressed: (){
              formValidation();
            },
          )
        ],
      ),
    );
  }
}
