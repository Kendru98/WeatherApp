import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:flutter/material.dart';

class SkeletonContainer extends StatelessWidget {
  const SkeletonContainer({Key? key, this.height, this.width})
      : super(key: key);

  final double? height, width;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [MyColors.mainLight, MyColors.mainDark],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          color: MyColors.textGreyCityItem,
        ),
      ),
    );
  }
}
