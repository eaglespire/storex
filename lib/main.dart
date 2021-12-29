import 'package:flutter/material.dart';
import 'package:storex/screens/home.dart';
import 'package:storex/splash.dart';
import 'package:storex/wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'StoreX',
      home: const Splash(),
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.blue[900],
          textTheme: TextTheme(
              bodyText1: TextStyle(
                fontFamily: 'Roboto',
              ),
              bodyText2:
                  TextStyle(fontFamily: 'Roboto', color: Colors.grey.shade800)),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              titleTextStyle:
                  const TextStyle(fontFamily: 'Montserrat', fontSize: 20.0),
              backgroundColor: Colors.blue[600],
              foregroundColor: Colors.grey[200]),
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.blue)),
    );
  }
}
