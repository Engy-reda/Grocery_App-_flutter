import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/screens/wishlist/wishlist_screen.dart';
import 'package:grocery_app/services/global_method.dart';
import 'package:grocery_app/widgets/list_tiles.dart';
import 'package:provider/provider.dart';

import '../provider/dark_theme_provider.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final TextEditingController _addressTextController =
      TextEditingController(text: '');
  String UpdateAdress = '';

  @override
  void dispose() {
    _addressTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    print(themeState.getDarkTheme);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(0.8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(
                        text: 'Hi ,  ',
                        style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                        children: <TextSpan>[
                      TextSpan(
                          text: 'MyName',
                          style: TextStyle(
                              color: color,
                              fontSize: 27,
                              fontWeight: FontWeight.w600),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('My name is pressed ');
                            })
                    ])),
                TextWidget(text: 'Email@email.com', color: color, textSize: 18),
                const SizedBox(
                  height: 20,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                _listTiles(
                    title: 'Adress',
                    icon: IconlyLight.profile,
                    onPressed: () async {
                      await _showDialog();
                    },
                    subTitle: UpdateAdress == '' ? 'adress2' : UpdateAdress,
                    color: color),
                _listTiles(
                    title: 'Order',
                    icon: IconlyLight.bag,
                    onPressed: () {},
                    color: color),
                _listTiles(
                    title: 'wishlist',
                    icon: IconlyLight.heart,
                    onPressed: () {
                      GlobalMethod.navigateTo(
                          ctx: context,
                          routeName: WishListScreen.routeNameWishListScreen);
                    },
                    color: color),
                _listTiles(
                    title: 'Viewed',
                    icon: IconlyLight.show,
                    onPressed: () {},
                    color: color),
                _listTiles(
                    title: 'Forget password',
                    icon: IconlyLight.unlock,
                    onPressed: () {},
                    color: color),
                SwitchListTile(
                    title: TextWidget(
                        text: themeState.getDarkTheme
                            ? 'Dark Mode'
                            : 'Light Mode',
                        color: color,
                        textSize: 24),
                    secondary: Icon(themeState.getDarkTheme
                        ? Icons.dark_mode_outlined
                        : Icons.light_mode_outlined),
                    value: themeState.getDarkTheme,
                    onChanged: (bool value) {
                      setState(() {
                        themeState.setDarkTheme = value;
                      });
                    }),
                _listTiles(
                    title: 'Logout',
                    icon: IconlyLight.logout,
                    onPressed: () {
                      _showLogoutDialog();
                    },
                    color: color)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showLogoutDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Row(
              children: [
                Image.asset(
                  'assets/images/warning-sign.png',
                  height: 20,
                  width: 20,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text('Sign out')
              ],
            ),
            content: const Text('Do you wants sign out'),
            actions: [
              TextButton(
                  onPressed: () {
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    }
                  },
                  child: TextWidget(
                      text: 'cancel', color: Colors.cyan, textSize: 18)),
              TextButton(
                  onPressed: () {},
                  child:
                      TextWidget(text: 'ok', color: Colors.red, textSize: 18))
            ],
          );
        });
  }

  Future<void> _showDialog() async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('update'),
            content: TextField(
              onChanged: (value) {
                print(
                    '_addressTextController.text ${_addressTextController.text}');
              },
              controller: _addressTextController,
              maxLines: 5,
              decoration: const InputDecoration(hintText: 'your adress'),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      UpdateAdress = _addressTextController.text;
                      Navigator.pop(context);

                      print('ffffffffff$UpdateAdress');
                    });
                  },
                  child: const Text('update'))
            ],
          );
        });
  }

  Widget _listTiles(
      {required String title,
      String? subTitle,
      required IconData icon,
      required Function onPressed,
      required Color color}) {
    return ListTile(
      title: TextWidget(text: title, color: color, textSize: 24),
      subtitle: TextWidget(
          text: subTitle == null ? '' : subTitle!, color: color, textSize: 18),
      leading: Icon(icon),
      trailing: const Icon(IconlyLight.arrowRight2),
      onTap: () {
        onPressed();
      },
    );
  }
}
