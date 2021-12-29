import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:storex/models/products.dart';

import '../constants.dart';

class MyBody extends StatefulWidget {
  MyBody({Key? key}) : super(key: key);
  final items = Products();
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  void seeAllProducts() {
    debugPrint('Browse products');
  }

  void buyProduct() {
    debugPrint('Buy product');
  }

  @override
  Widget build(BuildContext context) {
    /*
    Get the device height and orientation
     */

    final Orientation orientation = MediaQuery.of(context).orientation;
    final double deviceHeight = MediaQuery.of(context).size.height;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildBanner(height: deviceHeight),
            buildCarousel(items: widget.items),
          ],
        ),
      ),
    );
  }

  Widget buildBanner({required double height}) {
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
        padding: EdgeInsets.only(left: 20.0),
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
              onPressed: seeAllProducts,
              child: const Text(
                'Browse Products',
              ),
              style: ElevatedButton.styleFrom(primary: Colors.blue[300]),
            )
          ],
        ),
      ),
    );
  }

  Widget buildItemThumbnail(
      {required BuildContext context,
      required String title,
      required String description,
      required String image}) {
    final double itemHeight = MediaQuery.of(context).size.width;
    final Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0XFFF5F5FC),
      ),
      margin: const EdgeInsets.only(left: 2.0, right: 2.0),
      padding: EdgeInsets.all(10.0),
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
                      child: ElevatedButton(
                          onPressed: () {}, child: Text('Buy Now')))
                ],
              ),
            ),
          ),
          Positioned(
            right: 10.0,
            top: 50.0,
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage: AssetImage('assets/img/products/$image'),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCarousel({required Products items}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CarouselSlider(
            items: items.products.map((item) {
              return buildItemThumbnail(
                  context: context,
                  title: item.title,
                  description: item.description,
                  image: item.image);
            }).toList(),
            // items: [
            //   buildItemThumbnail(context: context),
            //   buildItemThumbnail(context: context),
            //   buildItemThumbnail(context: context),
            //   buildItemThumbnail(context: context),
            // ],
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.7,
              disableCenter: true,
              viewportFraction: 0.8,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildProduct({required double deviceHeight}) {
    return Container(
      height: deviceHeight,
      width: double.infinity,
      color: Colors.white,
      child: Row(),
    );
  }
}
