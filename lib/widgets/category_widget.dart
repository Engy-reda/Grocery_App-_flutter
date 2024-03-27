import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/list_tiles.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class CategoriesWidget extends StatelessWidget {
  CategoriesWidget(
      {super.key,
      required this.catText,
      required this.imagePath,
      required this.colorWidget});

  final String catText, imagePath;
  final Color colorWidget;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return InkWell(
      onTap: () {
        print('category pressed');
      },
      child: Container(
        decoration: BoxDecoration(
            color: colorWidget.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: colorWidget.withOpacity(0.7), width: 2)),
        child: Column(
          children: [
            Container(
              height: _screenWidth * 0.3,
              width: _screenWidth * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(imagePath), fit: BoxFit.fill)),
            ),
            TextWidget(
              text: catText,
              // color: color,
              color: color,
              textSize: 18,
              isTitle: true,
            )
          ],
        ),
      ),
    );
  }
}
