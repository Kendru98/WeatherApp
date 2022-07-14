import 'package:aplikacja_pogodowa/constans.dart';
import 'package:aplikacja_pogodowa/theme/theme.dart';
import 'package:aplikacja_pogodowa/widgets/sharedscaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SharedScaffold(
      title: 'ManageLocation',
      column: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              child: TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  prefixIcon: const Icon(FontAwesomeIcons.searchengin),
                  fillColor: MyColors.barfillcolor,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide.none),
                  hintText: 'Search Your City',
                  hintStyle: MyTheme.city12g,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                height: 80,
                margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
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
                      Text('Heavy Rain', style: MyTheme.city12),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
