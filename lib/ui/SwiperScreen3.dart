import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SwiperScreen3 extends StatefulWidget {
  @override
  _SwiperScreen3State createState() => _SwiperScreen3State();
}


class _SwiperScreen3State extends State<SwiperScreen3> with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<Offset> offset;
  final _totalDots = 7;
  double _currentPosition = 3.0;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    controller.forward();

    offset = Tween<Offset>(end: Offset.zero, begin: Offset(0.0, 1.0)).animate(
        controller);
    _updatePosition(_currentPosition);
  }

  double _validPosition(double position) {
    if (position >= _totalDots) return 0;
    if (position < 0) return _totalDots - 1.0;
    return position;
  }

  Widget _buildRow(List<Widget> widgets) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: widgets,
      ),
    );
  }

  void _updatePosition(double position) {
    setState(() => _currentPosition = _validPosition(position));
  }

  String getCurrentPositionPretty() {
    return (_currentPosition + 1.0).toStringAsPrecision(2);
  }

  @override
  Widget build(BuildContext context) {
    const decorator = DotsDecorator(
      color: Colors.grey, // Inactive color
      activeColor: Colors.black,
    );
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 90.0),
            Container(
              alignment: Alignment.center,
              child: Text.rich(
                TextSpan(
                  style: const TextStyle(fontSize: 20),
                  text: 'There are 3 navigation levels',
                  children: <TextSpan>[
                    TextSpan(text: '',
                        style: TextStyle(fontWeight: FontWeight.normal)),
                    TextSpan(
                      text: '',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 100.0),
            Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  _buildRow([
                    DotsIndicator(
                      dotsCount: _totalDots,
                      position: _currentPosition,
                      decorator: decorator,
                    ),
                  ],
                  ),
                  Image.asset(
                      'assets/images/3.png',
                      height: 430,
                      width: 350,
                      fit: BoxFit.scaleDown
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