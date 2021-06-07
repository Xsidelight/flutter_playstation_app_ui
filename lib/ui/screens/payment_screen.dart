import 'package:flutter/material.dart';
import 'package:flutter_playstation_app/ui/widgets/glowing_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
                  child: Stack(
                    children: [
                      Container(
                        height: 200,
                      ),
                      Positioned(
                          top: 60,
                          left: 1,
                          child: Image.asset('assets/images/card_white.png')),
                      Positioned(
                          top: 30,
                          left: 1,
                          child: Image.asset('assets/images/card_pink.png')),
                      Positioned(
                          top: 1,
                          left: 1,
                          child: Image.asset('assets/images/card_blue.png')),
                    ],
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
              height: 15,
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
