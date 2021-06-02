import 'package:flutter_playstation_app/data/model/product_model.dart';

var dummy_data = <Product>[
  Product(
      id: 1,
      title: 'PlayStation 5 S',
      reviews: 96,
      price: 15,
      description:
          'Experience lightning fast loading with an ultra-high speed SSD, deeper immersion with support for haptic feedback, adaptive triggers and 3D Audio1, and an all-new generation of... Read More',
      controller: 1,
      games: 24,
      imagePath: 'assets/images/ps5_pic.png'),
  Product(
      id: 2,
      title: 'Monitor TV 24 UHD',
      reviews: 87,
      price: 10,
      description:
          'Super cool monitor for the gamers. Enjoy gaming and quality of the screen. Supports various features and is specially good for the PlayStation5',
      controller: 0,
      games: 0,
      imagePath: 'assets/images/monitor_pic.png'),
];
