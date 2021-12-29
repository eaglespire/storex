import 'package:flutter/material.dart';
import 'package:storex/methods/reusable_app_bar.dart';
import 'package:storex/screens/account_screen.dart';
import 'package:storex/screens/help_screen.dart';
import 'package:storex/screens/home_screen.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  int _currentIndex = 0;
  final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    const AccountScreen(),
    const HelpScreen(),
  ];

  final List<BottomNavigationBarItem> _bottomNavItems =
      <BottomNavigationBarItem>[
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.account_circle), label: 'Account'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.help_outline), label: 'Help'),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ReusableAppBar(),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple[900],
        unselectedLabelStyle: const TextStyle(
            fontFamily: 'raleway_regular',
            fontSize: 16.0,
            fontWeight: FontWeight.w600),
        selectedLabelStyle:
            const TextStyle(fontFamily: 'raleway_bold', fontSize: 18.0),
        iconSize: 26.0,
        selectedItemColor: Colors.deepOrange,
        items: _bottomNavItems,
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
