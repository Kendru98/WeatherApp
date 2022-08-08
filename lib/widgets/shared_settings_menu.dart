// import 'package:aplikacja_pogodowa/utils/my_theme.dart';
// import 'package:flutter/material.dart';

// enum MenuTemperature { celsius, fahrenheit }

// class SharedSettingsMenu extends StatelessWidget {
//   const SharedSettingsMenu({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(16),
//         ),
//       ),
//       itemBuilder: (context) {
//         return [
//           PopupMenuItem(
//             value: MenuTemperature.celsius,
//             child: Text(
//               'Celsius',
//               style: MyTheme.popmenutext,
//             ),
//           ),
//           PopupMenuItem(
//             value: MenuTemperature.fahrenheit,
//             child: Text(
//               'Fahrenheit',
//               style: MyTheme.popmenutext,
//             ),
//           ),
//         ];
//       },
//        onSelected: (MenuWind value) => actionPopUp(context, value),
//       child: Text(
//         currentValue == 'kmh' ? kmh : ms,
//         style: MyTheme.settingsValue,
//       ),
//     );
//   }
// }
