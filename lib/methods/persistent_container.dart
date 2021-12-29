import 'package:flutter/material.dart';

import '../constants.dart';

Widget buildPersistentContainer(context, {required String title}) {
  List<Widget> _items = <Widget>[
    Text(
      '$title',
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 26.0),
    ),
    const SizedBox(
      height: 8.0,
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Container(
        color: Colors.blue,
        width: 90.0,
        height: 35.0,
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Back',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.keyboard_backspace)
            ],
          ),
        ),
      ),
    )
  ];
  return Container(
    width: double.infinity,
    height: 200.0,
    color: Colors.grey[800],
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: _items,
      ),
    ),
  );
}
