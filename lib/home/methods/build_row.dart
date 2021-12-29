import 'package:flutter/material.dart';
import 'package:storex/constants.dart';
import 'package:storex/home/methods/build_dropdown.dart';

Padding buildRow(
    {required void Function(String val) callback,
    required String defaultDropdown,
    required List<String> items}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        // Icon(
        //   Icons.account_circle,
        //   color: appBarTextColor,
        // ),
        // const SizedBox(
        //   width: 4.0,
        // ),
        // buildDropDown(
        //     callback: (String val) {
        //       callback(val);
        //     },
        //     defaultDropdown: defaultDropdown,
        //     items: items),
        // const SizedBox(
        //   width: 8.0,
        // ),
        Row(
          children: [
            Icon(
              Icons.shopping_cart,
              color: appBarTextColor,
            ),
            const SizedBox(
              width: 4.0,
            ),
            const Text(
              'Cart',
              style: appBarStyle,
            ),
            const SizedBox(
              width: 4.0,
            ),
          ],
        )
      ],
    ),
  );
}
