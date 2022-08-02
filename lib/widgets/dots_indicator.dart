import 'package:aplikacja_pogodowa/utils/my_colors.dart';
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({
    Key? key,
    required this.listLength,
    required this.index,
  }) : super(key: key);

  final int listLength;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: listLength,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, dotsIndex) {
          return Padding(
            padding: const EdgeInsets.only(left: 4),
            child: index == dotsIndex
                ? const CircleAvatar(
                    radius: 6,
                    backgroundColor: MyColors.whiteBackground,
                  )
                : const CircleAvatar(
                    radius: 6,
                    backgroundColor: MyColors.whiteBackground,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: MyColors.mainLight,
                    ),
                  ),
          );
        },
      ),
    );
  }
}
