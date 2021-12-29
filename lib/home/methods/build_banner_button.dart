import 'package:flutter/material.dart';

Widget buildBannerButton(
    {required VoidCallback onPressed, required String buttonText}) {
  return MaterialButton(
    padding: EdgeInsets.all(10.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    //textTheme: ButtonTextTheme.primary,
    highlightColor: Colors.orange,
    color: Colors.blue[800],
    onPressed: onPressed,
    child: Text(
      buttonText,
      style: const TextStyle(fontFamily: 'Montserrat'),
    ),
  );
}
