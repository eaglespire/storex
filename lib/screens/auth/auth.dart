import 'package:flutter/material.dart';
import 'package:storex/screens/auth/register.dart';
import 'package:storex/screens/auth/sign_in.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final List<Tab> _tabs = <Tab>[
    const Tab(
      text: 'Sign In',
    ),
    const Tab(
      text: 'Register',
    ),
  ];
  final List<Widget> _tabContents = <Widget>[const SignIn(), const Register()];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      //initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text('StoreX'),
          bottom: TabBar(
            tabs: _tabs,
          ),
        ),
        body: TabBarView(
          children: _tabContents,
        ),
      ),
    );
  }
}
