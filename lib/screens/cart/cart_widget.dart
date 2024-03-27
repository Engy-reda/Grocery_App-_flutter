import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/screens/cart/empty_screen.dart';
import 'package:grocery_app/services/global_method.dart';
import 'package:grocery_app/widgets/custom_buttom_plus_minus.dart';
import 'package:grocery_app/widgets/list_tiles.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_theme_provider.dart';
import '../../services/utils.dart';
import '../../widgets/custom_heart_bottom.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key});

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
  final _quantityTextControler = TextEditingController();

  @override
  void initState() {
    _quantityTextControler.text = '1';
    super.initState();
  }

  @override
  void dispose() {
    _quantityTextControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    final Color color = themeState.getDarkTheme ? Colors.white : Colors.black;
    Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    Color colorText = utils.color;
    return GestureDetector(
      onTap: () {
        GlobalMethod.navigateTo(
            ctx: context, routeName: EmptyScreen.routeEmptyScreen);
      },
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Container(
                      height: size.width * 0.25,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: FancyShimmerImage(
                        imageUrl:
                            'https://img.freepik.com/free-photo/large-set-isolated-vegetables-white-background_485709-44.jpg?w=1480&t=st=1708434163~exp=1708434763~hmac=7f75afd2407d25f7b844ded71d349dc74a356fd8082c629f5a30aaadfdf27e53',
                        boxFit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: 'title',
                          color: colorText,
                          textSize: 20,
                          isTitle: true,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          width: size.width * 0.3,
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 5,
                              ),
                              CustomButtomPlusOrMinus(
                                  color: Colors.red,
                                  icon: CupertinoIcons.minus,
                                  function: () {
                                    if (_quantityTextControler.text == '1') {
                                      return;
                                    } else {
                                      setState(() {
                                        _quantityTextControler.text =
                                            (int.parse(_quantityTextControler
                                                        .text) -
                                                    1)
                                                .toString();
                                      });
                                    }
                                  }),
                              const SizedBox(
                                width: 5,
                              ),
                              Flexible(
                                flex: 1,
                                child: TextField(
                                  controller: _quantityTextControler,
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide())),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp('[0-9]'))
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      if (value.isEmpty) {
                                        _quantityTextControler.text = '1';
                                        print(value);
                                      } else {
                                        return print('is errrrrrrror');
                                      }
                                    });
                                  },
                                ),
                              ),
                              CustomButtomPlusOrMinus(
                                  color: Colors.green,
                                  icon: CupertinoIcons.plus,
                                  function: () {
                                    setState(() {
                                      _quantityTextControler.text = (int.parse(
                                                  _quantityTextControler.text) +
                                              1)
                                          .toString();
                                    });
                                  }),
                            ],
                          ),
                        )
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              CupertinoIcons.cart_badge_minus,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const HeartButtom(),
                          TextWidget(
                            text: '\$${(_quantityTextControler.text)}',
                            color: color,
                            textSize: 18,
                            maxLines: 1,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
