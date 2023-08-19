import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.search,
      onSubmitted: (value){},
      decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(color: greyColor),
          fillColor: greyColor.withOpacity(0.1),
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            color: greyColor,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: softGreyColor.withOpacity(0.1),
              ),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: softGreyColor.withOpacity(0.5),
              ),
            borderRadius: BorderRadius.circular(8),
          ),
      ),
    );
  }
}
