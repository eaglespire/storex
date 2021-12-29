import 'package:flutter/material.dart';
return Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Expanded(
child: CarouselSlider(items: List.generate(8, (index){
return buildItemThumbnail(
context: context,
title: products[index]["title"],
description: products[index]["description"],
image: products[index]["image"],
);
}),
options: CarouselOptions(
autoPlay: true,
aspectRatio: 1.7,
disableCenter: true,
viewportFraction: 0.8,
),
}))
),
],
);