import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/category_widget.dart';
import 'package:grocery_app/widgets/list_tiles.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({super.key});
  List<Map<String, dynamic>> catInfo = [
    {
      'imagePath': 'assets/images/cat/fruits.png',
      'catText': 'Fruits',
      'color': const Color(0xff38175)
    },
    {
      'imagePath': 'assets/images/cat/grains.png',
      'catText': 'Grains',
      'color': const Color(0xfff8a44c)
    },
    {
      'imagePath': 'assets/images/cat/nuts.png',
      'catText': 'Nuts',
      'color': const Color(0xfff7a593)
    },
    {
      'imagePath': 'assets/images/cat/spices.png',
      'catText': 'Spices',
      'color': const Color(0xff3b0e0)
    },
    {
      'imagePath': 'assets/images/cat/Spinach.png',
      'catText': 'Herbs',
      'color': const Color(0xfffde598)
    },
    {
      'imagePath': 'assets/images/cat/veg.png',
      'catText': 'Vegetables',
      'color': const Color(0xffb7dff5)
    }
  ];

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: TextWidget(
          text: 'Categories',
          color: color,
          textSize: 24,
          isTitle: true,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 240 / 250,
          crossAxisSpacing: 30,
          mainAxisSpacing: 30,
          children: List.generate(6, (index) {
            return CategoriesWidget(
              catText: catInfo[index]['catText'],
              imagePath: catInfo[index]['imagePath'],
              colorWidget: catInfo[index]['color'],
            );
          }),
        ),
      ),
    );
  }
}
