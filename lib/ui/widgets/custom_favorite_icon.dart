import 'package:flutter/material.dart';

class CustomFavoriteIcon extends StatelessWidget {
  const CustomFavoriteIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).primaryColor,
      ),
      child: Center(
        child: Icon(
          Icons.favorite_border,
          size: 30,
        ),
      ),
    );
  }
}
