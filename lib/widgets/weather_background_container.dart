import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:flutter/material.dart';

class WeatherBackgroundContainer extends StatelessWidget {
  const WeatherBackgroundContainer(
      {Key? key, this.child, this.topPadding, this.topRadius})
      : super(key: key);
  final Widget? child;
  final double? topPadding;
  final double? topRadius;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: 16, right: 16, bottom: 16, top: topPadding ?? 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: const Radius.circular(30),
          bottomRight: const Radius.circular(30),
          topLeft: Radius.circular(topRadius ?? 0),
          topRight: Radius.circular(topRadius ?? 0),
        ),
        gradient: const LinearGradient(
          colors: [MyColors.mainLight, MyColors.mainDark],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
      child: child,
    );
  }
}
