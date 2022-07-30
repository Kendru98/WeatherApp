import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:aplikacja_pogodowa/widgets/container_skeleton.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  static const routeName = '/loading-page';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              height: (height / 2.2),
              width: double.infinity,
              margin: const EdgeInsets.only(
                  left: 16, right: 16, bottom: 16, top: 4),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
                gradient: LinearGradient(
                  colors: [MyColors.mainLight, MyColors.mainDark],
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: CircularProgressIndicator(
                  color: MyColors.textGreyCityItem,
                ),
              ),
            ),
            SkeletonContainer(
              height: (height / 5),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
