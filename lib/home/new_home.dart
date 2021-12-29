import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:storex/constants.dart';

import 'package:storex/models/products.dart';

class NewHome extends StatefulWidget {
  NewHome({Key? key}) : super(key: key);
  final items = Products();
  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
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
    return ListView(
      children: [
        buildBanner(height: deviceHeight),
        buildCarousel(items: widget.items),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Popular Products',
            style: bannerDescription,
          ),
        ),
        activePromotions(height: deviceHeight, items: widget.items),
        /*buildGrid(
            height: deviceHeight,
            items: widget.items.products,
            orientation: orientation,
            context: context),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Trending Now',
            style: bannerDescription,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Active Promotions',
            style: bannerDescription,
          ),
        ),*/
      ],
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

//   Widget buildGrid(
//       {required double height,
//       required List items,
//       required Orientation orientation,
//       required BuildContext context}) {
//     final TextTheme textTheme = Theme.of(context).textTheme;
//     return SizedBox(
//       width: double.infinity,
//       height: 0.6 * height,
//       child: StaggeredGridView.countBuilder(
//         crossAxisCount: 4,
//         itemCount: items.length,
//         itemBuilder: (context, int index) => Card(
//           child: Padding(
//             padding: const EdgeInsets.only(bottom: 8.0, right: 8.0),
//             child: Stack(
//               alignment: AlignmentDirectional.bottomEnd,
//               children: [
//                 SizedBox(
//                   height: 300.0,
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Flexible(
//                             child: Text(
//                           '${items[index].title}',
//                           style: textTheme.headline6,
//                         )),
//                         Flexible(
//                             child: Text(
//                           '${items[index].description}',
//                           style: textTheme.subtitle1,
//                         )),
//                         ElevatedButton(
//                           onPressed: buyProduct,
//                           child: Text('Buy '
//                               'Now'),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: orientation == Orientation.landscape ? 50.0 : 0,
// // right: 0,
//                   child: SizedBox(
//                     width: orientation == Orientation.landscape ? 70.0 : 50.0,
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(20.0),
//                       child: Image.asset('assets/img/products/product-4.jpg'),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
//         mainAxisSpacing: 4.0,
//         crossAxisSpacing: 4.0,
//       ),
//     );
//   }

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

  Widget activePromotions({required double height, required Products items}) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: height,
      width: double.infinity,
      child: GridView(
        //shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        reverse: true,
        children: items.products.map((item) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.orange,
            ),
            child: Center(
                child: Column(
              children: [
                Image.asset('assets/img/products/${item.image}'),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.title,
                    style: textTheme.headline6,
                  ),
                )),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.description,
                    style: textTheme.subtitle1,
                  ),
                )),
              ],
            )),
          );
        }).toList(),
        //itemCount: items.products.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            childAspectRatio: 0.4),
        // itemBuilder: (context, index) {
        //   return Container(
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(12.0),
        //       color: Colors.orange,
        //     ),
        //     child: Center(
        //         child: Column(
        //       children: [
        //         Image.asset(
        //             'assets/img/products/${items.products[index].image}'),
        //         Flexible(
        //             child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text(
        //             items.products[index].title,
        //             style: textTheme.headline6,
        //           ),
        //         )),
        //         Flexible(
        //             child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Text(
        //             items.products[index].description,
        //             style: textTheme.subtitle1,
        //           ),
        //         )),
        //       ],
        //     )),
        //   );
        // },
      ),
    );
  }
}
