import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storex/models/products.dart';

class SecondSliver extends StatefulWidget {
  const SecondSliver({
    Key? key,
    required this.bannerHeight,
  }) : super(key: key);

  final double bannerHeight;

  @override
  State<SecondSliver> createState() => _SecondSliverState();
}

class _SecondSliverState extends State<SecondSliver> {
  final items = Products();
  //var rating = 3.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: widget.bannerHeight,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
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
            ),
          ),
        ],
      ),
    );
  }
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
