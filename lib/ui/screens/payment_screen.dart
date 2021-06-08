import 'package:flutter/material.dart';
import 'package:flutter_playstation_app/ui/widgets/glowing_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with TickerProviderStateMixin {
  int firstCardIndex = 0;
  int secondCardIndex = 1;
  int thirdCardIndex = 2;

  bool isPressed = false;

  late AnimationController _animationControllerFirst;
  late AnimationController _animationControllerSecond;
  late AnimationController _animationControllerThird;

  late Animation<double> _firstCardAnimation;
  late Animation<double> _secondCardAnimation;
  late Animation<double> _thirdCardAnimation;

  void firstCardTapped() {
    setState(() {
      firstCardIndex = 0;
      secondCardIndex = 1;
      thirdCardIndex = 2;
    });
    _animationControllerFirst.forward();
    _animationControllerSecond.forward();
    _animationControllerThird.forward();
  }

  void secondCardTapped() {
    setState(() {
      secondCardIndex = 0;
      firstCardIndex = 1;
      thirdCardIndex = 2;
    });
    _animationControllerFirst.forward();
    _animationControllerSecond.forward();
    _animationControllerThird.forward();
  }

  void thirdCardTapped() {
    _animationControllerFirst.forward();
    _animationControllerThird.forward();
    _animationControllerSecond.forward();
    setState(() {
      secondCardIndex = 1;
      firstCardIndex = 2;
      thirdCardIndex = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _animationControllerFirst =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));
    _animationControllerSecond =
        AnimationController(vsync: this, duration: Duration(milliseconds: 150));
    _animationControllerThird =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _firstCardAnimation =
        Tween<double>(begin: 1, end: 400).animate(_animationControllerFirst);
    _secondCardAnimation =
        Tween<double>(begin: 1, end: 400).animate(_animationControllerSecond);
    _thirdCardAnimation =
        Tween<double>(begin: 1, end: 400).animate(_animationControllerThird);
    _animationControllerFirst.addListener(() {
      setState(() {
        if (_animationControllerFirst.status  == AnimationStatus.completed) {
          _animationControllerFirst.reverse();
        }
      });
    });
    _animationControllerSecond.addListener(() {
      setState(() {
        if (_animationControllerSecond.status  == AnimationStatus.completed) {
          _animationControllerSecond.reverse();
        }
      });
    });
    _animationControllerThird.addListener(() {
      setState(() {
        if (_animationControllerThird.status  == AnimationStatus.completed) {
          _animationControllerThird.reverse();
        }
      });
    });
  }

  @override
  void dispose() {
    _animationControllerFirst.dispose();
    _animationControllerSecond.dispose();
    _animationControllerThird.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 33),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Payment',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Flexible(
                    flex: 1,
                    child: Container(
                      height: 140,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )),
                Flexible(
                  flex: 3,
                  child: Stack(
                    children: [
                      Container(
                        height: 230,
                        width: double.infinity,
                      ),
                      Positioned(
                        left: 1,
                        child: Image.asset(
                          'assets/images/card_main.png',
                          height: 230,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).accentColor,
                        ),
                        child: Icon(
                          Icons.shopping_basket,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Icon(
                          Icons.monetization_on,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    height: 220,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 65,
                          left: _thirdCardAnimation.value,
                          child: GestureDetector(
                            onTap: () => thirdCardTapped(),
                            child: IndexedStack(
                              index: thirdCardIndex,
                              children: [
                                Image.asset('assets/images/card_white.png'),
                                Image.asset('assets/images/card_pink.png'),
                                Image.asset('assets/images/card_blue.png'),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 35,
                          left: _secondCardAnimation.value,
                          child: GestureDetector(
                            onTap: () => secondCardTapped(),
                            child: IndexedStack(
                              index: secondCardIndex,
                              children: [
                                Image.asset('assets/images/card_white.png'),
                                Image.asset('assets/images/card_pink.png'),
                                Image.asset('assets/images/card_blue.png'),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 1,
                          left: _firstCardAnimation.value,
                          child: GestureDetector(
                            onTap: () => firstCardTapped(),
                            child: IndexedStack(
                              index: firstCardIndex,
                              children: [
                                Image.asset('assets/images/card_white.png'),
                                Image.asset('assets/images/card_pink.png'),
                                Image.asset('assets/images/card_blue.png'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Detail',
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Total',
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 33),
              child: GlowingButton(
                title: 'Pay',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
