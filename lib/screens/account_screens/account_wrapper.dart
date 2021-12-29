import 'package:flutter/material.dart';
import 'package:storex/screens/account_screens/settings.dart';

import 'blog.dart';
import 'offers.dart';

class AccountWrapper extends StatefulWidget {
  const AccountWrapper({Key? key}) : super(key: key);

  @override
  _AccountWrapperState createState() => _AccountWrapperState();
}

class _AccountWrapperState extends State<AccountWrapper> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  List<BottomNavigationBarItem> _navItems = <BottomNavigationBarItem>[
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
    BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Blog'),
    BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Offers'),
  ];
  void _onTapped(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }

  void _onPageChanged(int index) {}

  List<Widget> _pages = <Widget>[
    Settings(),
    Blog(),
    Offers(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('StoreX'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _navItems,
        currentIndex: _currentIndex,
        onTap: _onTapped,
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: _pages,
          onPageChanged: _onPageChanged,
          physics: const BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
