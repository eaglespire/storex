import 'package:flutter/material.dart';
import 'package:storex/constants.dart';

import 'package:storex/home/methods/build_row.dart';
import 'package:storex/files/my_list.dart';
import 'package:storex/screens/help_screen.dart';

import 'account_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String defaultDropDown = 'Accounts';
  List<String> items = ['Log In', 'Register', 'Accounts'];
  int _selectedIndex = 0;

  List<Widget> _pages = <Widget>[
    Home(),
    AccountScreen(),
    HelpScreen(),
  ];

  void _isTapped(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: Image.asset('assets/img/logo.png'),
        title: Stack(
          children: [
            Container(
              child: Text(
                appName,
                style: TextStyle(
                    color: appBarTextColor,
                    fontSize: 24.0,
                    fontFamily: 'raleway_black',
                    fontWeight: FontWeight.bold),
              ),
              margin: const EdgeInsets.only(right: 12.0),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                color: appBarTextColor,
                width: 10,
                height: 10,
              ),
            )
          ],
        ),
        actions: [
          buildRow(
              callback: (String val) {
                setState(() {
                  defaultDropDown = val;
                });
              },
              defaultDropdown: defaultDropDown,
              items: items)
        ],
      ),
      body: MyList(),
      bottomNavigationBar: BottomNavigationBar(
        unselectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.w500, fontFamily: 'raleway_bold'),
        selectedLabelStyle: const TextStyle(
            fontFamily: 'raleway_black', fontWeight: FontWeight.w800),
        iconSize: 30.0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey.shade800,
        currentIndex: _selectedIndex,
        onTap: _isTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              label: 'Categories',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
              icon: Icon(Icons.help_outline),
              label: 'Help',
              backgroundColor: Colors.white),
        ],
      ),
    );
  }
}
