import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storex/methods/get_currency.dart';
import 'package:storex/methods/persistent_container.dart';

import '../../constants.dart';

class Inbox extends StatelessWidget {
  Inbox({Key? key}) : super(key: key);

  final List<Widget> _items = <Widget>[
    DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.black26),
        ),
      ),
      child: ListTile(
          leading: Image.asset('assets/img/latest-1.jpg'),
          trailing: const Icon(Icons.close),
          title: Text(
            'MK-Fancy Sneakers',
            style: textStyle2,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${getCurrency()} 1,980',
                style: textStyle2,
              ),
              ElevatedButton(
                onPressed: () => print('Buy now'),
                child: const Text('Buy Now'),
              ),
            ],
          )),
    ),
  ];
  final List<Map<String, dynamic>> _lists = <Map<String, dynamic>>[
    {
      'id': 1,
      'title': 'MK-Fancy Sneakers',
      'price': '1980',
      'img': 'assets/img/latest-1.jpg'
    },
    {
      'id': 2,
      'title': 'Orlandia Yorghurt',
      'price': '700',
      'img': 'assets/img/latest-2.jpg'
    },
    {
      'id': 3,
      'title': 'Blue Lace Material',
      'price': '13,890',
      'img': 'assets/img/latest-3.jpg'
    },
    {
      'id': 4,
      'title': 'Oraimo Earpiece',
      'price': '1250',
      'img': 'assets/img/latest-2.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              buildPersistentContainer(context, title: 'Inbox'),
              Column(
                children: _lists.map((item) {
                  return DecoratedBox(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black26),
                      ),
                    ),
                    child: ListTile(
                        leading: Image.asset('${item['img']}'),
                        trailing: const Icon(Icons.close),
                        title: Text(
                          '${item['title']}',
                          style: textStyle2,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${getCurrency()} ${item['price']}',
                              style: textStyle2,
                            ),
                            ElevatedButton(
                              onPressed: () => print('Buy now'),
                              child: const Text('Buy Now'),
                            ),
                          ],
                        )),
                  );
                }).toList(),
              )
            ]),
          )
        ],
      ),
    );
  }
}
