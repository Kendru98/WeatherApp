import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:flutter/material.dart';

class WeatherAppBar extends StatelessWidget implements PreferredSizeWidget {
  const WeatherAppBar({
    Key? key,
    this.title,
    this.leading,
    this.actions,
    this.elevation = 0.0,
  }) : super(key: key);
  final Widget? title;
  final Widget? leading;
  final double elevation;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        elevation: elevation,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
          ),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: MyColors.mainLight,
            ),
            child: AppBar(
              centerTitle: true,
              leading: leading,
              elevation: 0,
              title: title,
              actions: actions,
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
