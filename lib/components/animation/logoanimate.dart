import 'dart:math';
import 'package:flutter/material.dart';

class LogoAnimate extends StatefulWidget {
  @override
  _LogoAnimate createState() => _LogoAnimate();
}

class _LogoAnimate extends State<LogoAnimate> {
  double _size = 100.0;

  Tween<double> _animationTween = Tween<double>(begin: 0, end: pi * 2);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder<double>(
          tween: _animationTween,
          duration: Duration(seconds: 3),
          builder: (context, double value, child) {
            return Transform.rotate(
              angle: value,
              child: Container(
                child: Image.asset(
                  'assets/logo.png',
                  width: _size,
                  height: _size,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
