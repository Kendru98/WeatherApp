import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:flutter/material.dart';

class WeatherBackgroundContainer extends StatelessWidget {
  const WeatherBackgroundContainer({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          colors: [MyColors.mainLight, MyColors.mainDark],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
