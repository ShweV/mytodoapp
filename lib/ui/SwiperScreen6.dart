import 'package:flutter/material.dart';

class SwiperScreen6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 18),
      primary: Colors.white,
      onPrimary: Colors.black,
      side: BorderSide(color: Colors.black, width: 1),
      padding: EdgeInsets.only(top: 10, left: 30, bottom: 10, right: 30),
    );
    double topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: Container(
        margin: EdgeInsets.only(
            top: topPadding, left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/icloud.jpg',
                height: 250,
                width: 150,
                fit: BoxFit.scaleDown
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(fontSize: 40, color: Colors.black),
                children: const <TextSpan>[
                  TextSpan(text: 'Use '),
                  TextSpan(
                      text: 'iCloud',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '?'),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text.rich(
              TextSpan(
                  style: const TextStyle(fontSize: 20),
                  text: 'Storing your lists in iCloud allows you to keep your '
                      'data in sync across your iPhone, iPad and Mac.'),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {},
                    style: style,
                    child: Text(
                      "Not now",
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton (
                    onPressed: () {},
                    style: style,
                    child: Text(
                      "Use iCloud",
                    ),
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}