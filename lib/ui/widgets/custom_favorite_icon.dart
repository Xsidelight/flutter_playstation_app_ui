import 'package:flutter/material.dart';

class CustomFavoriteIcon extends StatefulWidget {
  const CustomFavoriteIcon({Key? key}) : super(key: key);

  @override
  _CustomFavoriteIconState createState() => _CustomFavoriteIconState();
}

class _CustomFavoriteIconState extends State<CustomFavoriteIcon> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).primaryColor,
        ),
        child: AnimatedSwitcher(
          duration: Duration(milliseconds: 400),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: !isFavorite
              ? Center(
                  key: UniqueKey(),
                  child: Icon(
                    Icons.favorite_border,
                    size: 30,
                  ),
                )
              : Center(
                  key: UniqueKey(),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 30,
                  ),
                ),
        ),
      ),
    );
  }
}
