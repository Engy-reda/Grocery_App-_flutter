import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/screens/cart/cart.dart';
import 'package:grocery_app/screens/categories_screens.dart';
import 'package:grocery_app/screens/home_page.dart';
import 'package:grocery_app/screens/users_screen.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class CustomBottomBar extends StatefulWidget {
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 0;
  final List<Map<String, dynamic>> _pages = [
    {'page': const HomeScreen(), 'title': 'Home Screen'},
    {'page': CategoriesScreen(), 'title': 'Categories Screen '},
    {'page': const CartScreen(), 'title': 'Cart Screen '},
    {'page': const UsersScreen(), 'title': 'Users Screen '},
  ];
  void _selected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    bool _isDark = themeState.getDarkTheme;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[_selectedIndex]['title']),
      //   backgroundColor: Colors.white,
      // ),
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: _isDark ? Theme.of(context).cardColor : Colors.white,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: _selectedIndex,
          unselectedItemColor: _isDark ? Colors.white10 : Colors.black12,
          selectedItemColor:
              _isDark ? Colors.lightBlue.shade200 : Colors.black87,
          onTap: _selected,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                  _selectedIndex == 0 ? IconlyBold.home : IconlyLight.home),
            ),
            BottomNavigationBarItem(
                label: 'category',
                icon: Icon(_selectedIndex == 1
                    ? IconlyBold.category
                    : IconlyLight.category)),
            BottomNavigationBarItem(
              label: 'Card',
              icon:
                  Icon(_selectedIndex == 2 ? IconlyBold.buy : IconlyLight.buy),
            ),
            BottomNavigationBarItem(
              label: 'Users',
              icon: Icon(
                  _selectedIndex == 3 ? IconlyBold.user2 : IconlyLight.user2),
            ),
          ]),
    );
  }
}
