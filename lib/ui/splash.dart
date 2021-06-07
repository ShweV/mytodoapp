
import 'package:MyToDoApp/ui/main.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(Splash());
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: const Text.rich(
              TextSpan(
                style: const TextStyle(fontSize: 24),
                text: 'Welcome to ', // default text style
                children: <TextSpan>[
                  TextSpan(text: 'Clear ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '\n \n Tap or Swipe ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  TextSpan(text: 'to begin', style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
                ],
              ),
            ),
            nextScreen: MyApp(),
            splashTransition: SplashTransition.slideTransition,
            pageTransitionType: PageTransitionType.rightToLeft,
            backgroundColor: Colors.white
        )
    );
  }
}