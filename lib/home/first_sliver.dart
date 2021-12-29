import 'package:flutter/material.dart';
import 'package:storex/home/methods/build_banner_button.dart';
import 'package:storex/home/methods/build_banner_text.dart';

class FirstSliver extends StatelessWidget {
  const FirstSliver({
    Key? key,
    required this.bannerHeight,
  }) : super(key: key);

  final double bannerHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: bannerHeight,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/img/banner-3'
            '.jpg',
          ),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.only(left: 8.0),
          width: 150.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildBannerText(text: 'All you need in the kitchen'),
              Flexible(
                  child: Text(
                'This is some random text that will show up '
                'here',
                style:
                    TextStyle(color: Colors.grey[600], fontFamily: 'lora_bold'),
              )),
              buildBannerButton(
                  onPressed: () {
                    print('Working');
                  },
                  buttonText: 'Browse Products')
            ],
          ),
        ),
      ),
    );
  }
}
