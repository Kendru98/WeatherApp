import 'package:aplikacja_pogodowa/utils/constans.dart';
import 'package:aplikacja_pogodowa/utils/theme.dart';
import 'package:aplikacja_pogodowa/widgets/cities_history_list.dart';
import 'package:aplikacja_pogodowa/widgets/shared_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchCityPage extends StatelessWidget {
  const SearchCityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SharedScaffold(
      title: 'Manage Location',
      column: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              cursorColor: Colors.grey,
              decoration: InputDecoration(
                prefixIcon: const Icon(FontAwesomeIcons.searchengin),
                fillColor: MyColors.textFieldFill,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Search Your City',
                hintStyle: MyTheme.city12g,
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return const CitiesHistoryList();
            },
          ),
        ],
      ),
    );
  }
}
