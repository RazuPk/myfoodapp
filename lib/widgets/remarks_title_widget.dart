import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/style.dart';
class RemarksTitleWidget extends StatelessWidget {
  const RemarksTitleWidget({
    super.key, required this.remarksTitle, required this.onTap,
  });
  final String remarksTitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(remarksTitle,style: titleStyle.copyWith(color: primaryColor,fontSize: 24),),
        Spacer(),
        TextButton(
          onPressed: onTap,
          child: Text("See All"),
        ),
      ],
    );
  }
}
