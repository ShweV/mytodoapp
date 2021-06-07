import 'package:flutter/material.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class SwipeScreen extends StatefulWidget {
  @override
  _SwipeScreenState createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> offset;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _controller.forward();

    offset = Tween<Offset>(end: Offset.zero, begin: Offset(0.0, 1.0)).animate(
        _controller);
  }

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> _pageNotifier = new ValueNotifier<int>(0);
    final PageController controller = PageController(initialPage: 0);
    var totalCards = 7;
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.horizontal,
        controller: controller,
        children : [
          Stack (
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      child: Text.rich(
                        TextSpan(
                          style: const TextStyle(fontSize: 20),
                          text: 'Clear sorts item by ',
                          children: <TextSpan>[
                            TextSpan(text: 'Priority ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            TextSpan(
                              text: '\n \n  Important items are highlighted \nat the top.. ',
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 20),
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                      child : Center(
                        child: CirclePageIndicator(
                          currentPageNotifier: _pageNotifier,
                          itemCount: totalCards,
                        ),
                      )
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: SlideTransition(
                      position: offset,
                      child: Column (
                        children : [
                          Image.asset(
                              'assets/images/2.png',
                              height: 450,
                              width: 350,
                              fit: BoxFit.scaleDown
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]
          ),
        ],
        onPageChanged:(index) {
          setState(() {
            _pageNotifier.value = index;
          });
        },
      ),
    );
  }
}