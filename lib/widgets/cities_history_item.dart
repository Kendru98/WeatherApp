import 'package:aplikacja_pogodowa/models/weather_item.dart';
import 'package:aplikacja_pogodowa/providers/weather_provider.dart';
import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:aplikacja_pogodowa/utils/data_conversion_helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CitiesHistoryItem extends StatelessWidget {
  const CitiesHistoryItem({
    Key? key,
    required this.index,
    required this.weatherItem,
  }) : super(key: key);
  final WeatherItem weatherItem;
  final int index;

  void onTapCityList(BuildContext context) {
    final provider = context.read<WeatherProvider>();
    provider.fetchData(weatherItem.lat, weatherItem.lon);
    Navigator.pop(context);
  }

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
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: ListTile(
        onTap: () => onTapCityList(context),
        title: Text(
          textAlign: TextAlign.left,
          weatherItem.name,
          style: MyTheme.city16,
        ),
        subtitle: Text(
          textAlign: TextAlign.left,
          '${DataConversionHelpers.temperatureConversion(weatherItem.temp)}/${DataConversionHelpers.temperatureConversion(weatherItem.tempFeelsLike)}',
          style: MyTheme.city12,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image(
              width: 32,
              height: 32,
              color: MyColors.popText,
              image: AssetImage(
                DataConversionHelpers.chooseMainIcon(weatherItem.description),
              ),
            ),
            Text(
              weatherItem.description,
              style: MyTheme.city12,
            ),
          ],
        ),
      ),
    );
  }
}
