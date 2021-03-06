import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class SwiperScreen4 extends StatefulWidget {
  @override
  _SwiperScreen4State createState() => _SwiperScreen4State();
}


class _SwiperScreen4State extends State<SwiperScreen4>{
  final _totalDots = 7;
  double _currentPosition = 4.0;

  @override
  void initState() {
    super.initState();
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
                  text: 'Pinch together vertically',
                  children: <TextSpan>[
                    TextSpan(text: 'to collapse you r current level and \n navigate up',
                        style: TextStyle(fontWeight: FontWeight.normal)),
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
                        'assets/images/4.png',
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