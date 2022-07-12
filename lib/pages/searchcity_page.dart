import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

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
                        padding: const EdgeInsets.only(top: 23.0, left: 63),
                        child: Text(
                          textAlign: TextAlign.center,
                          'Manage location',
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.only(top: 37.0)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      height: 32,
                      child: TextField(
                        cursorColor: Colors.grey,
                        decoration: InputDecoration(
                          fillColor: Color(0xffF2F2F2),
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                              borderSide: BorderSide.none),
                          hintText: 'Search Your City',
                          hintStyle: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  height: 1,
                                  color: Color(0xff828282),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                          prefixIcon: Icon(FontAwesomeIcons.searchengin),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 32.0)),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 8, right: 16, left: 16),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          child: ListTile(
                            title: Text(
                              textAlign: TextAlign.left,
                              'Malang',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color(0xff1B2541),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400)),
                            ),
                            subtitle: Text(
                              textAlign: TextAlign.left,
                              '20°/24°',
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color(0xff545B70),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400)),
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
                                  '20°/24°',
                                  style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Color(0xff545B70),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
