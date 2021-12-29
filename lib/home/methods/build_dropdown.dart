import 'package:flutter/material.dart';
import 'package:storex/constants.dart';

DropdownButton buildDropDown(
    {required String defaultDropdown,
    required List<String> items,
    required void Function(String val) callback}) {
  return DropdownButton(
    borderRadius: BorderRadius.circular(8.0),
    dropdownColor: Colors.blue[200],
    icon: Icon(
      Icons.keyboard_arrow_down,
      color: appBarTextColor,
    ),
    value: defaultDropdown,
    items: items.map((String item) {
      return DropdownMenuItem(
        child: Text(
          item,
          style: appBarStyle,
        ),
        value: item,
      );
    }).toList(),
    onChanged: (dynamic val) {
      callback(val);
    },
    // onChanged: (String? newValue) {
    //   setState(() {
    //     defaultDropDown = newValue!;
    //   });
    // },
  );
}
