import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CitiesHistoryList extends StatelessWidget {
  const CitiesHistoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: ListTile(
        title: Text(
          textAlign: TextAlign.left,
          'Malang',
          style: MyTheme.city16,
        ),
        subtitle: Text(
          textAlign: TextAlign.left,
          '20°/24°',
          style: MyTheme.city12,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              FontAwesomeIcons.cloudSunRain,
              size: 32,
            ),
            Text(
              'Heavy Rain',
              style: MyTheme.city12,
            ),
          ],
        ),
      ),
    );
  }
}
