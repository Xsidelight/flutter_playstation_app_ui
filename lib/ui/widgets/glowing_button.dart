import 'package:flutter/material.dart';
import 'package:flutter_playstation_app/ui/screens/payment_screen.dart';

class GlowingButton extends StatefulWidget {
  const GlowingButton({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _GlowingButtonState createState() => _GlowingButtonState();
}

class _GlowingButtonState extends State<GlowingButton>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _animation = Tween(begin: 0.0, end: 3.0).animate(_controller);
    _controller.addListener(() {
      setState(() {});
    });
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => PaymentScreen())),
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xfff05cc6),
              blurRadius: _animation.value,
              spreadRadius: _animation.value,
            )
          ],
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
      ),
    );
  }
}
