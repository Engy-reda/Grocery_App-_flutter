import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor:
            isDarkTheme ? const Color(0xff00001a) : const Color(0xffffffff),
        primaryColor: Colors.blue,
        colorScheme: ThemeData().colorScheme.copyWith(
            brightness: isDarkTheme ? Brightness.dark : Brightness.light,
            secondary: isDarkTheme
                ? const Color(0xFF1a1f3c)
                : const Color(0xffe8fdfd)),
        cardColor:
            isDarkTheme ? const Color(0xff0a0d2c) : const Color(0xfff2fdfd),
        canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              colorScheme:
                  isDarkTheme ? const ColorScheme.dark() : ColorScheme.light(),
            ));
  }
}
