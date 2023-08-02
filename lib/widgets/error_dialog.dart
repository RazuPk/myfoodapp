import 'package:flutter/material.dart';


class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, this.message});
final String? message;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(message!),
      actions: [
        ElevatedButton(
          child: Center(
            child: Text('Ok'),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
