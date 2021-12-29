import 'package:flutter/material.dart';

class ReusableAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ReusableAppBar({Key? key}) : super(key: key);

  @override
  _ReusableAppBarState createState() => _ReusableAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ReusableAppBarState extends State<ReusableAppBar> {
  List cartItems = [];
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.deepPurple,
      leading: Container(
        margin: const EdgeInsets.only(left: 8.0),
        child: Image.asset(
          'assets/img/logo.png',
        ),
      ),
      titleTextStyle: TextStyle(
          fontFamily: 'raleway_black',
          fontSize: 18.0,
          color: Colors.grey.shade200),
      title: const Text('Online Store'),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: [
              const Icon(
                Icons.shopping_cart,
                size: 36.0,
              ),
              ClipOval(
                child: Container(
                  color: Colors.deepOrange,
                  width: 30.0,
                  height: 30.0,
                  child: Center(
                    child: Text('${cartItems.length}'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
