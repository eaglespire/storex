import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storex/constants.dart';

class ThirdSliver extends StatefulWidget {
  const ThirdSliver({Key? key, required this.bannerHeight}) : super(key: key);
  final double bannerHeight;

  @override
  _ThirdSliverState createState() => _ThirdSliverState();
}

class _ThirdSliverState extends State<ThirdSliver> {
  @override
  Widget build(BuildContext context) {
    // return Row(
    //   children: [
    //     Expanded(
    //       child: Container(
    //         padding: EdgeInsets.all(10.0),
    //         color: Colors.blue.shade100,
    //         height: 300.0,
    //         width: 100.0,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.stretch,
    //           children: [
    //             Container(
    //               padding: EdgeInsets.all(5.0),
    //               margin: EdgeInsets.only(bottom: 5.0),
    //               width: 100.0,
    //               color: Colors.blue,
    //               child: Row(
    //                 children: [
    //                   Icon(
    //                     Icons.align_horizontal_center,
    //                   ),
    //                   Text(
    //                     'Save 100',
    //                     style: productHeaderStyle,
    //                   )
    //                 ],
    //               ),
    //             ),
    //             Expanded(
    //                 flex: 2,
    //                 child: Image.asset('assets/img/products/phone_1'
    //                     '.png')),
    //             Expanded(
    //               child: Column(
    //                 children: [
    //                   Expanded(
    //                     child: Text(
    //                       'Asus Transformer',
    //                       style: productBodyStyle,
    //                     ),
    //                   ),
    //                   Expanded(
    //                       child: Text('Asus Zen Book Pro Duo',
    //                           style: productBodyStyle2)),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //     Expanded(
    //       child: Container(
    //         padding: EdgeInsets.all(10.0),
    //         color: Colors.green.shade300,
    //         height: 300.0,
    //         width: 100.0,
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.stretch,
    //           children: [
    //             Container(
    //               padding: EdgeInsets.all(5.0),
    //               margin: EdgeInsets.only(bottom: 5.0),
    //               width: 100.0,
    //               color: Colors.blue,
    //               child: Row(
    //                 children: [
    //                   Icon(
    //                     Icons.align_horizontal_center,
    //                   ),
    //                   Text(
    //                     'Save 100',
    //                     style: productHeaderStyle,
    //                   )
    //                 ],
    //               ),
    //             ),
    //             Expanded(
    //                 flex: 2,
    //                 child: Image.asset('assets/img/products/phone_1'
    //                     '.png')),
    //             Expanded(
    //               child: Column(
    //                 children: [
    //                   Expanded(
    //                     child: Text(
    //                       'Asus Transformer',
    //                       style: productBodyStyle,
    //                     ),
    //                   ),
    //                   Expanded(
    //                       child: Text('Asus Zen Book Pro Duo',
    //                           style: productBodyStyle2)),
    //                 ],
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //     ),
    //   ],
    // );
    return GridView.count(
        crossAxisCount: 2,
        children: List.generate(4, (index) {
          return Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.blue.shade100,
              height: 300.0,
              width: 100.0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                        padding: EdgeInsets.all(5.0),
                        margin: EdgeInsets.only(bottom: 5.0),
                        width: 100.0,
                        color: Colors.blue,
                        child: Row(
                          children: [
                            Icon(
                              Icons.align_horizontal_center,
                            ),
                            Text(
                              'Save 100',
                              style: productHeaderStyle,
                            )
                          ],
                        ))
                  ]));
        }));
  }
}
