import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myfoodapp/widgets/loading_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../global/global.dart';
import '../../widgets/error_dialog.dart';
import '../../widgets/app_text_field_widget.dart';
import 'package:firebase_storage/firebase_storage.dart' as fstorage;

import '../mainScreen/Home_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  XFile? imageXFile;
  final ImagePicker _picker = ImagePicker();
  String sellerImageUrl = '';

  Future<void> _getImage() async {
    imageXFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageXFile;
    });
  }

  Future<void> formValidation() async {
    if (imageXFile == null) {
      showDialog(
        context: context,
        builder: (c) {
          return ErrorDialog(
            message: "Please select an Image",
          );
        },
      );
    } else {
      if (passController.text == confirmPassController.text) {
        if (nameController.text.isNotEmpty &&
            emailController.text.isNotEmpty &&
            confirmPassController.text.isNotEmpty &&
            phoneController.text.isNotEmpty &&
            locationController.text.isNotEmpty) {
          //start uploading image
          showDialog(
              context: context,
              builder: (c) {
                return LoadingDialog(
                  message: "Registering Account...",
                );
              });
          String filename = DateTime.now().millisecondsSinceEpoch.toString();
          fstorage.Reference reference = fstorage.FirebaseStorage.instance.ref().child('sellers').child(filename);
          fstorage.UploadTask uploadTask = reference.putFile(File(imageXFile!.path));
          fstorage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
          await taskSnapshot.ref.getDownloadURL().then((url) {
            sellerImageUrl = url;
            //save info to fire store database
            authenticateSellerAndSignUp();
          });
        } else {
          showDialog(
            context: context,
            builder: (c) {
              return ErrorDialog(
                message: "Please provide required information...",
              );
            },
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (c) {
            return ErrorDialog(
              message: "Password do not match.",
            );
          },
        );
      }
    }
  }

  void authenticateSellerAndSignUp() async {
    User? currentUser;

    await firebaseAuth.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passController.text.trim(),
    ).then((auth) {
      currentUser = auth.user;
    }).catchError((error){
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (c) {
          return ErrorDialog(
            message: error.message.toString(),
          );
        },
      );
    });

    if (currentUser != null) {
      saveDataToFirestore(currentUser!).then((value) {
        Navigator.pop(context);
        //send user to homepage
        Route newRoute = MaterialPageRoute(builder: (c) => HomeScreen());
        Navigator.pushReplacement(context, newRoute);
      });
    }
  }

  Future saveDataToFirestore(User currentUser) async {
    FirebaseFirestore.instance.collection('sellers').doc(currentUser.uid).set(
      {
        'sellerUid': currentUser.uid,
        'sellerEmail': currentUser.email,
        'sellerName': nameController.text.trim(),
        'sellerPhoto': sellerImageUrl,
        'phone': phoneController.text.trim(),
        'address': locationController.text.trim(),
        'status': 'approved',
        'earnings': 0.0,
      },
    );
//save to locally
    SharedPreferences? sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString("uid", currentUser.uid);
    await sharedPreferences.setString("email", currentUser.email.toString());
    await sharedPreferences.setString("name", nameController.text.trim());
    await sharedPreferences.setString("photoUrl", sellerImageUrl);

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              _getImage();
            },
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.20,
              backgroundColor: Colors.white,
              backgroundImage:
                  imageXFile == null ? null : FileImage(File(imageXFile!.path)),
              child: imageXFile == null
                  ? Icon(
                      Icons.add_photo_alternate,
                      size: MediaQuery.of(context).size.width * 0.20,
                      color: Colors.grey,
                    )
                  : null,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                AppTextFieldWidget(
                  data: Icons.person,
                  controller: nameController,
                  hintText: 'Name',
                  isObscure: false,
                  textInputType: TextInputType.text,
                ),
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
                AppTextFieldWidget(
                  data: Icons.lock,
                  controller: confirmPassController,
                  hintText: 'Confirm Password',
                  isObscure: false,
                  textInputType: TextInputType.visiblePassword,
                ),
                AppTextFieldWidget(
                  data: Icons.phone,
                  controller: phoneController,
                  hintText: 'Phone',
                  isObscure: false,
                  textInputType: TextInputType.phone,
                ),
                AppTextFieldWidget(
                  data: Icons.my_location,
                  controller: locationController,
                  hintText: 'Cafe/Restaurant Address',
                  isObscure: false,
                  textInputType: TextInputType.streetAddress,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          ElevatedButton(
            onPressed: () {
              formValidation();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
            ),
            child: const Text(
              'Sign Up',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
