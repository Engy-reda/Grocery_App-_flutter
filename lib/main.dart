import 'package:flutter/material.dart';
import 'package:grocery_app/consts/theme_data.dart';
import 'package:grocery_app/inner_screen/food_screen.dart';
import 'package:grocery_app/inner_screen/on_sales_screen.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/screens/cart/empty_screen.dart';
import 'package:grocery_app/screens/wishlist/wishlist_screen.dart';
import 'package:grocery_app/widgets/custom_buttom_bar.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme =
        await themeChangeProvider.darkThemePrefs.getTheme();
  }

  void initState() {
    getCurrentAppTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeChangeProvider;
          })
        ],
        child: Consumer<DarkThemeProvider>(
            builder: (context, themePovider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: Styles.themeData(themePovider.getDarkTheme, context),
            home: CustomBottomBar(),
            routes: {
              OnSalesScreen.routeNameOnSalesScreen: (context) =>
                  OnSalesScreen(),
              FoodsScreen.routeNameFoodsScreen: (context) => FoodsScreen(),
              EmptyScreen.routeEmptyScreen: (context) => EmptyScreen(),
              WishListScreen.routeNameWishListScreen: (context) =>
                  WishListScreen(),
            },
          );
        }));
  }
}
