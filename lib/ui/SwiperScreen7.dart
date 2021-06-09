import 'package:MyToDoApp/widgets/TaskList.dart';
import 'package:MyToDoApp/widgets/TodoList.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SwiperScreen7 extends StatelessWidget {

  ButtonStyle style = ElevatedButton.styleFrom(
    textStyle: const TextStyle(fontSize: 18),
    primary: Colors.white,
    onPrimary: Colors.black,
    side: BorderSide(color: Colors.black, width: 1),
    padding: EdgeInsets.only(top: 12, left: 55, bottom: 12, right: 55),
  );

  @override
  Widget build(BuildContext context) {
    double topPadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      body: Container(
        margin: EdgeInsets.only(
            top: topPadding, left: 40, right: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 22),
                text: 'Sign up to the newsletter, and unlock a theme for your lists.',
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset('assets/images/email.png'),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(width: 4,color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children : [
                ElevatedButton(
                  onPressed: () {
                  },
                  style: style,
                  child: Text(
                    "Skip",
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TodoList()),
                    );
                  },
                  style: style,
                  child: Text(
                    "Join",
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}