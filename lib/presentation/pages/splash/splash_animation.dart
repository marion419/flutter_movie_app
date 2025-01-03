import 'dart:async';

import 'package:flutter/material.dart';

class SplashAnimation extends StatefulWidget {
  @override
  State<SplashAnimation> createState() => _SplashAnimationState();
}

class _SplashAnimationState extends State<SplashAnimation> {
  bool isOn = false;
  Timer? timer;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isOn = !isOn;
      }),
      child: Container(
        width: double.infinity,
        height: 400,
        alignment: Alignment.centerRight,
        color: Colors.blue,
        child: Stack(children: [
          Positioned(
            right: isOn ? 50 : 0,
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              color: Colors.amber,
              width: isOn ? 150 : 100,
              height: 100,
              curve: Curves.easeIn,
            ),
          ),
        ]),
      ),
    );
  }
}
