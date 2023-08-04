import 'package:flutter/material.dart';

class AppTextFieldWidget extends StatelessWidget {


  final TextEditingController? controller;
  final IconData? data;
  final String? hintText;
  final TextInputType? textInputType;
  bool? isObscure = true;
  bool? enabled = true;

  AppTextFieldWidget({
    this.controller,
    this.data,
    this.hintText,
    this.isObscure,
    this.enabled,
    this.textInputType,
});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
        padding:const EdgeInsets.all(8.0),
        margin:const EdgeInsets.all(10),
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        obscureText: isObscure!,
        keyboardType: textInputType,
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            data,
            color: Colors.cyan,
          ),
          focusColor: Theme.of(context).primaryColor,
          hintText: hintText
        ),

      ),
    );
  }
}
