import 'package:flutter/material.dart';

class CustomRotationWidget extends StatefulWidget {
  const CustomRotationWidget({Key? key}) : super(key: key);

  @override
  _CustomRotationWidgetState createState() => _CustomRotationWidgetState();
}

class _CustomRotationWidgetState extends State<CustomRotationWidget> {
  Offset _offset = Offset(0.4, 0.7);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {setState(() {
        _offset += details.delta;
      });},
      onDoubleTap: () {
        setState(() {
          _offset = Offset.zero;
        });
      },
      child: Container(
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            // ..rotateX(0.01 * _offset.dy),
            ..rotateY(-0.01 * _offset.dx),
          alignment: Alignment.center,
          child: Image.asset('assets/images/ps5_pic_details.png'),
        ),
      ),
    );
  }
}
