import 'package:aplikacja_pogodowa/widgets/container_skeleton.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: SkeletonContainer(
                height: (height / 2),
              ),
            ),
            SkeletonContainer(
              height: (height / 4.5),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
