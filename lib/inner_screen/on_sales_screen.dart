import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/back_widget.dart';
import 'package:grocery_app/widgets/list_tiles.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';
import '../services/utils.dart';
import '../widgets/foods_widget.dart';

class OnSalesScreen extends StatelessWidget {
  const OnSalesScreen({super.key});
  static const routeNameOnSalesScreen = 'OnSalesScreen';

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
        leading: const BackWidget(),
        title: TextWidget(
          text: 'Product on sale',
          color: colorText,
          textSize: 24,
          isTitle: true,
        ),
      ),
      body: _isEmpaty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    new Image.asset(
                      'assets/images/box.png',
                      fit: BoxFit.fill,
                    ),
                    Text('No product on sale yet! , \n stay tuned',
                        style: TextStyle(
                          color: colorText,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center)
                  ],
                ),
              ),
            )
          : GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.7),
              children: List.generate(16, (index) {
                return const FoodsWidgets();
              }),
            ),
    );
  }
}
