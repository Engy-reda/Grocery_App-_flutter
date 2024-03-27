import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/list_tiles.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../services/utils.dart';
import '../widgets/custom_search_widget.dart';
import '../widgets/foods_widget.dart';

class FoodsScreen extends StatefulWidget {
  const FoodsScreen({super.key});

  static const routeNameFoodsScreen = 'FoodsScreen';

  @override
  State<FoodsScreen> createState() => _FoodsScreenState();
}

class _FoodsScreenState extends State<FoodsScreen> {
  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    Color colorText = utils.color;
    bool _isEmpaty = false;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: colorText,
          ),
        ),
        centerTitle: true,
        title: TextWidget(
          text: 'All Product',
          color: colorText,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          const CustomSearchWidget(),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            childAspectRatio: size.width / (size.height * 0.7),
            children: List.generate(16, (index) {
              return const FoodsWidgets();
            }),
          ),
        ]),
      ),
    );
  }
}
