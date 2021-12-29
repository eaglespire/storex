import 'package:flutter/material.dart';
import 'package:storex/methods/persistent_container.dart';

class SavedItems extends StatelessWidget {
  const SavedItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              buildPersistentContainer(context, title: 'Saved Items'),
            ]),
          )
        ],
      ),
    );
  }
}
