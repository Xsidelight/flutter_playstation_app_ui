import 'package:flutter/material.dart';

class CustomNotificationIcon extends StatelessWidget {
  const CustomNotificationIcon({Key? key}) : super(key: key);

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
        child: Stack(
          children: [
            Icon(
              Icons.notifications_none,
              size: 30,
            ),
            Positioned(
              left: 15,
                child: CircleAvatar(
              radius: 7,
              backgroundColor: Colors.red,
              child: Text('4', style: TextStyle(fontSize: 8),),
            ))
          ],
        ),
      ),
    );
  }
}
