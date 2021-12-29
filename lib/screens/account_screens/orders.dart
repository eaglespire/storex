import 'package:flutter/material.dart';
import 'package:storex/methods/persistent_container.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              buildPersistentContainer(context, title: 'Orders'),
            ]),
          )
        ],
      ),
    );
  }
}
