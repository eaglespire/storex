import 'package:flutter/material.dart';

Widget buildBannerText({required String text}) {
  return Text(
    text,
    style: TextStyle(
        fontSize: 26.0,
        color: Colors.blue.shade800,
        fontWeight: FontWeight.bold,
        fontFamily: 'lora_bold'),
  );
}
