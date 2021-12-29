import 'dart:convert';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:storex/methods/get_currency.dart';
import 'package:storex/methods/snackbar.dart';
import 'package:storex/models/product.dart';
import 'package:storex/models/products.dart';
import 'package:storex/screens/product_detail.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _products = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final data = await json.decode(response);
    setState(() {
      _products = data["items"];
      print(_products);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    readJson();
  }

  /*
  Truncate string
   */
  String _truncateString(String data, int length) {
    return (data.length >= length) ? '${data.substring(0, length)}...' : data;
  }

  var items = Products();
  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    TextTheme textTheme = Theme.of(context).textTheme.copyWith(
          headline6: TextStyle(
              color: Colors.grey.shade900,
              fontWeight: FontWeight.bold,
              fontSize: 18.0),
          subtitle1: TextStyle(color: Colors.grey.shade600, fontSize: 16.0),
        );
    return ListView(
      children: [
        buildBanner(height: deviceHeight),
        buildCarousel(products: _products, context: context),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Trending Products',
            style: TextStyle(
                color: Colors.grey.shade800,
                fontFamily: 'raleway'
                    '_bold',
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
        ),
        _products.isNotEmpty
            ? Wrap(
                alignment: WrapAlignment.center,
                children: List.generate(_products.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return ProductDetail(
                          id: _products[index]["id"],
                          title: _products[index]["title"],
                          description: _products[index]["description"],
                          image: _products[index]["image"],
                          price: _products[index]["price"],
                        );
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.grey.shade100,
                      ),
                      padding: const EdgeInsets.only(
                          left: 5.0, right: 5.0, top: 5.0),
                      margin: const EdgeInsets.all(5.0),
                      width: 0.45 * deviceWidth,
                      //width: orientation == Orientation.landscape ? 300.0 : 190.0,
                      height: 400.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(_products[index]["image"]),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _products[index]["title"],
                                style: textTheme.headline6,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                _truncateString(
                                    _products[index]["description"], 50),
                                style: textTheme.subtitle1,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${getCurrency()} '
                                '${_products[index]["price"]}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.deepOrange[600]),
                            onPressed: () {
                              print('$index');
                              //Show a SnackBar
                              snackBar(
                                  context: context,
                                  message: 'Item added'
                                      ' successfully');
                            },
                            child: Text('Buy Now'),
                          )
                        ],
                      ),
                    ),
                  );
                }),
              )
            : const Text('Loading...')
      ],
    );
  }
}

Widget buildItemThumbnail(
    {required BuildContext context,
    required String title,
    required String description,
    required int price,
    required String image}) {
  final double itemHeight = MediaQuery.of(context).size.width;
  final Orientation orientation = MediaQuery.of(context).orientation;
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      color: const Color(0XFFF5F5FC),
    ),
    margin: const EdgeInsets.only(left: 2.0, right: 2.0),
    padding: const EdgeInsets.all(10.0),
    width: 0.4 * itemHeight,
    //height: 300.0,
    child: Stack(
      fit: StackFit.loose,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Container(
            width: orientation == Orientation.portrait
                ? 0.35 * itemHeight
                : 0.45 * itemHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: Colors.blue[900], fontWeight: FontWeight.bold),
                  ),
                  flex: 1,
                ),
                Flexible(
                  child: Text(
                    description,
                    style: TextStyle(
                        color: Colors.grey[700], fontFamily: 'lora_bold'),
                  ),
                  flex: 2,
                ),
                Flexible(
                    child: Row(
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 3.0),
                        child: Text(
                          '${getCurrency()} $price',
                          style: const TextStyle(fontSize: 17.0),
                        ),
                      ),
                    ),
                    Flexible(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepOrange[600]),
                        onPressed: () {
                          //show a snackbar
                          snackBar(
                              context: context,
                              message: 'Item added successfully');
                        },
                        child: const Text('Buy Now'),
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ),
        ),
        Positioned(
          right: 10.0,
          top: 50.0,
          child: CircleAvatar(
            radius: 40.0,
            backgroundImage: AssetImage(image),
          ),
        )
      ],
    ),
  );
}

Widget buildBanner({required double height, void callback}) {
  return DecoratedBox(
    position: DecorationPosition.foreground,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.centerLeft,
        colors: [
          Colors.grey.shade700,
          Colors.transparent,
          //Colors.grey.shade500,
        ],
      ),
    ),
    child: Container(
      padding: const EdgeInsets.only(left: 20.0),
      width: double.infinity,
      height: 0.5 * height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/img/banner-3.jpg'), fit: BoxFit.cover),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FractionallySizedBox(
            widthFactor: 0.4,
            child: Text(
              'All you need in the kitchen',
              style: bannerTitle,
            ),
          ),
          FractionallySizedBox(
            widthFactor: 0.4,
            child: Text(
              'This is some description '
              'text',
              style: bannerDescription,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              callback;
            },
            child: const Text(
              'Browse Products',
            ),
            style: ElevatedButton.styleFrom(primary: Colors.deepOrange[600]),
          )
        ],
      ),
    ),
  );
}

Widget buildCarousel({required List products, context}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 1.7,
            disableCenter: true,
            viewportFraction: 0.8,
          ),
          items: List.generate(8, (index) {
            return buildItemThumbnail(
                context: context,
                title: products[index]["title"],
                description: products[index]["description"],
                image: products[index]["image"],
                price: products[index]["price"]);
          }),
        ),
      )
    ],
  );
}
