import 'package:MyToDoApp/ui/SwiperScreen1.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'SwiperScreen2.dart';
import 'SwiperScreen3.dart';
import 'SwiperScreen4.dart';
import 'SwiperScreen5.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    //WidgetsBinding.instance.addPostFrameCallback((_) => _animateSlider());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
            children: [
              SwiperScreen1(),
              SwiperScreen2(),
              SwiperScreen3(),
              SwiperScreen4(),
              SwiperScreen5(),
          ],
          onPageChanged: (num){
            print("Current page number is "+num.toString());
          },
          physics: ClampingScrollPhysics(),
        ),
      ),
    );
  }
}


