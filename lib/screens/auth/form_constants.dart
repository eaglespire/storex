import 'package:flutter/material.dart';

final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();
final OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide.none, borderRadius: BorderRadius.circular(30.0));
final OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderSide: BorderSide.none, borderRadius: BorderRadius.circular(30.0));
final OutlineInputBorder errorBorder = OutlineInputBorder(
    borderSide: BorderSide.none, borderRadius: BorderRadius.circular(30.0));
final OutlineInputBorder focusedErrorBorder = OutlineInputBorder(
    borderSide: BorderSide.none, borderRadius: BorderRadius.circular(30.0));
final InputBorder generalBorder = OutlineInputBorder(
    borderSide: BorderSide.none, borderRadius: BorderRadius.circular(30.0));
final InputBorder disabledBorder = OutlineInputBorder(
    borderSide: BorderSide.none, borderRadius: BorderRadius.circular(30.0));
final TextStyle _labelStyle = TextStyle(
    letterSpacing: 2.0,
    color: Colors.grey.shade900,
    fontFamily: 'raleway_medium',
    fontSize: 21.0,
    fontWeight: FontWeight.bold);
final TextStyle hintStyle =
    TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold);
final TextStyle inputText = TextStyle(
    color: Colors.grey.shade200,
    fontWeight: FontWeight.bold,
    fontFamily: 'raleway_bold');
final Color fillColor = Colors.deepPurple.shade300;
const contentPadding = const EdgeInsets.all(25.0);
