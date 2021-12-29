import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:storex/methods/get_currency.dart';
import 'package:storex/methods/reusable_app_bar.dart';
import 'package:storex/methods/snackbar.dart';
import 'package:storex/wrapper.dart';

import 'auth/auth.dart';
import 'auth/register.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail(
      {Key? key,
      required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price})
      : super(key: key);

  final int id;
  final String title;
  final String description;
  final String image;
  final int price;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final TextStyle _style = TextStyle(
      fontSize: 20.0,
      color: Colors.grey.shade900,
      fontFamily: 'raleway_regular',
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    int _currentIndex = 0;
    return Scaffold(
      appBar: const ReusableAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        selectedLabelStyle:
            const TextStyle(fontFamily: 'raleway_bold', fontSize: 20.0),
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.orange,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                if (_currentIndex == 0) {
                  return const Wrapper();
                }
                return const Auth();
              },
            ),
          );
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(widget.image),
                  ),
                  Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Container(
                              child: const Center(
                                child: Text(
                                  'Official Store',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'raleway_bold'),
                                ),
                              ),
                              width: 100.0,
                              height: 30.0,
                              color: Colors.deepPurple,
                            ),
                          ),
                          Text(
                            widget.title,
                            style: _style,
                          ),
                          Text(
                            '${getCurrency()} ${widget.price}',
                            style: _style,
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Material(
                            color: Colors.white,
                            elevation: 10.0,
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              width: double.infinity,
                              height: 50.0,
                              child: const Text(
                                'Description',
                                style: TextStyle(
                                    fontFamily: 'raleway_black',
                                    fontSize: 17.0),
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.white,
                            elevation: 10.0,
                            child: Container(
                              padding: const EdgeInsets.all(10.0),
                              width: double.infinity,
                              //height: 150.0,
                              child: Text(
                                widget.description,
                                style: const TextStyle(
                                    fontFamily: 'montserrat', fontSize: 17.0),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.deepOrange,
                                padding: const EdgeInsets.all(12.0)),
                            onPressed: () {
                              print('Cart updated');
                              //show a snackbar
                              snackBar(
                                  context: context,
                                  message: 'Item added successfully');
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.shopping_cart),
                                Text('Add to Cart'),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    elevation: 5.0,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
