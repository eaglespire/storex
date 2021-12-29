import 'package:flutter/material.dart';

TextStyle _style = const TextStyle(fontFamily: 'raleway_black');

void snackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      action: SnackBarAction(
        onPressed: () {},
        label: 'Got it',
        textColor: Colors.grey[900],
      ),
      backgroundColor: Colors.orange,
      content: Text(
        message,
        style: _style,
      ),
    ),
  );
}
