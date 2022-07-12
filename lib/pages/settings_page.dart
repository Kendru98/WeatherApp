import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  static const keyTempUnit = 'key-tempunit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                gradient: LinearGradient(
                    colors: [Color(0xff62B8F6), Color(0xff2C79C1)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
            ),
            Align(
              alignment: FractionalOffset.center,
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 32,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 23.0, left: 95),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Settings',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 37.0),
//                   child: SettingsScreen(
// title: 'asd',
//                   ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
