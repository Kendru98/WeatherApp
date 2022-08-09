import 'package:aplikacja_pogodowa/utils/my_theme.dart';
import 'package:flutter/material.dart';

class PopupMenu<T> extends StatelessWidget {
  final Map<T, String> values;
  final T currentValue;
  final void Function(T) onSelected;
  const PopupMenu({
    Key? key,
    required this.values,
    required this.currentValue,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      itemBuilder: (context) {
        return values.entries
            .map(
              (e) => PopupMenuItem(
                value: e.key,
                child: Text(
                  e.value,
                  style: MyTheme.popmenutext,
                ),
              ),
            )
            .toList(growable: false);
      },
      onSelected: onSelected,
      child: Text(
        values[currentValue] ?? '',
        style: MyTheme.settingsValue,
      ),
    );
  }
}
