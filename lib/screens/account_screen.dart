import 'package:flutter/material.dart';
import 'package:storex/methods/get_currency.dart';

import 'package:storex/models/summary.dart';
import 'package:storex/screens/account_screens/account_wrapper.dart';
import 'package:storex/screens/account_screens/inbox.dart';
import 'package:storex/screens/account_screens/orders.dart';

import 'account_screens/settings.dart';
import 'auth/auth.dart';
import 'auth/sign_in.dart';

TextStyle _firstStyle = const TextStyle(
    color: Colors.white, fontFamily: 'raleway_bold', fontSize: 18.0);

TextStyle _secondStyle = const TextStyle(
    color: Colors.deepOrange, fontFamily: 'raleway_bold', fontSize: 20.0);

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final List<Summary> _summaries = <Summary>[
    Summary('Orders', const Icon(Icons.nordic_walking), 1),
    Summary('Inbox', const Icon(Icons.mail_outline), 2),
    Summary('Saved Items', const Icon(Icons.favorite_border), 3),
    Summary('Recently Viewed', const Icon(Icons.access_alarms), 4),
    Summary('Recently Searched', const Icon(Icons.youtube_searched_for), 4),
    Summary('Settings', const Icon(Icons.settings), 5),
  ];

  void navigate(int id) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      switch (id) {
        case 1:
          return const Orders();
        case 2:
          return Inbox();
        default:
          return const AccountWrapper();
      }
    }));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Column(
                children: [
                  introContainer(),
                  balanceContainer(),
                  Column(
                    children: _summaries.map((item) {
                      return ListTile(
                        selectedTileColor: Colors.red,
                        hoverColor: Colors.grey.shade800,
                        onTap: () {
                          print(item.id);
                          navigate(item.id);
                        },
                        title: Text(
                          item.title,
                          style: TextStyle(
                              color: Colors.grey.shade900,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: item.icon,
                        trailing: const Icon(Icons.arrow_forward_ios),
                      );
                    }).toList(),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const Auth();
                      }));
                    },
                    child: Text(
                      'LOGOUT',
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontSize: 20.0,
                          fontFamily: 'raleway_black'),
                    ),
                    color: Colors.grey[800],
                    minWidth: double.infinity,
                    height: 80.0,
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

Widget introContainer() {
  return Container(
    color: Colors.grey[900],
    width: double.infinity,
    height: 150.0,
    padding: const EdgeInsets.only(left: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Account',
          style: _firstStyle,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Andrew!',
              style: _secondStyle,
            ),
            Text(
              'eaglespiresolutions@gmail.com',
              style: _firstStyle,
            )
          ],
        )
      ],
    ),
  );
}

Widget balanceContainer() {
  TextStyle _balanceLeft = const TextStyle(
      color: Colors.deepPurple,
      fontWeight: FontWeight.w700,
      fontSize: 18.0,
      fontFamily: 'raleway_medium');

  return Material(
    elevation: 4.0,
    child: Container(
      padding: const EdgeInsets.only(left: 12.0),
      color: Colors.white,
      width: double.infinity,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.account_balance_wallet,
            color: Colors.deepPurple,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(
            'Your balance: '
            '${getCurrency()} 54.0',
            style: _balanceLeft,
          )
        ],
      ),
    ),
  );
}
