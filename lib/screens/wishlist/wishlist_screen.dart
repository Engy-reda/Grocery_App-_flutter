import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_app/screens/wishlist/wishlist_widget.dart';
import 'package:grocery_app/widgets/back_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_theme_provider.dart';
import '../../services/utils.dart';
import '../../widgets/list_tiles.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});
  static const routeNameWishListScreen = 'WishListScreen';

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    Color colorText = utils.color;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: const BackWidget(),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  IconlyBroken.delete,
                  color: color,
                ))
          ],
          title: TextWidget(
            text: 'Wishlist',
            color: color,
            textSize: 22,
            isTitle: true,
          ),
        ),
        body: MasonryGridView.count(
          crossAxisCount: 2,
          // mainAxisSpacing: 4,
          // crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return const WishListWidget();
          },
        ));
  }
}
