import 'package:flutter/material.dart';

class HomeScreenListViewItem extends StatelessWidget {
  const HomeScreenListViewItem(
      {Key? key,
      required this.title,
      required this.reviews,
      required this.price,
      required this.imagePath})
      : super(key: key);

  final String title;
  final int reviews;
  final int price;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 285,
      width: 225,
      color: Theme.of(context).primaryColor,
      child: Stack(
        children: [
          Image.asset(imagePath),
          Positioned(
            top: 190,
            left: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Theme.of(context).accentColor,
                    ),
                    Text(
                      '${reviews.toString()} Reviews',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '\$${price.toString()}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      TextSpan(
                        text: '/day',
                        style: TextStyle(fontSize: 16, color: Colors.white70),
                      ),
                    ],
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
