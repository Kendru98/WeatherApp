import 'package:flutter/material.dart';
import '../utils/theme.dart';

class SharedScaffold extends StatelessWidget {
  const SharedScaffold({super.key, required this.title, required this.column});

  final String title;
  final Column column;
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
                      child: Text(title,
                          textAlign: TextAlign.center,
                          style: MyTheme.main16w600),
                    ),
                  ],
                ),
                const SizedBox(height: 37),
                column
              ],
            ),
          ),
        ],
      ),
    );
  }
}
