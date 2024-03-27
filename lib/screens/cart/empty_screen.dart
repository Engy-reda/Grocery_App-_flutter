import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/custom_heart_bottom.dart';
import 'package:grocery_app/widgets/list_tiles.dart';
import 'package:provider/provider.dart';

import '../../provider/dark_theme_provider.dart';
import '../../services/utils.dart';
import '../../widgets/custom_buttom_plus_minus.dart';

class EmptyScreen extends StatefulWidget {
  const EmptyScreen({super.key});
  static const routeEmptyScreen = 'EmptyScreen';

  @override
  State<EmptyScreen> createState() => _EmptyScreenState();
}

class _EmptyScreenState extends State<EmptyScreen> {
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
    bool _isEmpaty = false;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: colorText,
            size: 24,
          ),
        ),
      ),
      body: Column(
        children: [
          // FancyShimmerImage(
          //   imageUrl:
          //       'https://img.freepik.com/free-photo/large-set-isolated-vegetables-white-background_485709-44.jpg?w=1480&t=st=1708434163~exp=1708434763~hmac=7f75afd2407d25f7b844ded71d349dc74a356fd8082c629f5a30aaadfdf27e53',
          //   boxFit: BoxFit.fill,
          //   width: double.infinity,
          //   height: size.width * 0.75,
          // ),
          Flexible(
            flex: 2,
            child: Image.asset(
              'assets/images/cat/Spinach.png',
              fit: BoxFit.scaleDown,
              width: size.width,
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: TextWidget(
                            text: 'Spinach',
                            color: color,
                            textSize: 25,
                            isTitle: true,
                          ),
                        ),
                        const HeartButtom(),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: '\$ 0.99',
                          color: Colors.green,
                          textSize: 22,
                          isTitle: true,
                        ),
                        TextWidget(
                          text: '${_quantityTextControler.text}/kg',
                          color: color,
                          textSize: 12,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Visibility(
                            visible: true,
                            child: Text(
                              '\$3.9',
                              style: TextStyle(
                                fontSize: 15,
                                color: color,
                                decoration: TextDecoration.lineThrough,
                              ),
                            )),
                        const Spacer(),
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(63, 200, 101, 1),
                                borderRadius: BorderRadius.circular(5)),
                            child: TextWidget(
                              text: 'Free delivery',
                              color: Colors.white,
                              textSize: 20,
                              isTitle: true,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButtomPlusOrMinus(
                          color: Colors.red,
                          icon: CupertinoIcons.minus_square,
                          function: () {
                            if (_quantityTextControler.text == '1') {
                              return;
                            } else {
                              setState(() {
                                _quantityTextControler.text =
                                    (int.parse(_quantityTextControler.text) - 1)
                                        .toString();
                              });
                            }
                          }),
                      const SizedBox(width: 5),
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
                            FilteringTextInputFormatter.allow(RegExp('[0-9]'))
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
                      const SizedBox(width: 5),
                      CustomButtomPlusOrMinus(
                          color: Colors.green,
                          icon: CupertinoIcons.plus_app,
                          function: () {
                            setState(() {
                              _quantityTextControler.text =
                                  (int.parse(_quantityTextControler.text) + 1)
                                      .toString();
                            });
                          }),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 30),
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextWidget(
                              text: 'Total',
                              color: Colors.red,
                              textSize: 20,
                              isTitle: true,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            FittedBox(
                              child: Row(
                                children: [
                                  TextWidget(
                                    text: '\$ 0.99',
                                    color: color,
                                    textSize: 20,
                                    isTitle: true,
                                  ),
                                  TextWidget(
                                    text: '${_quantityTextControler.text}/kg',
                                    color: color,
                                    textSize: 15,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Material(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextWidget(
                                    text: 'Add to Cart',
                                    color: Colors.white,
                                    textSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



 // Padding(
          //   padding: const EdgeInsets.all(12),
          //   child: Container(
          //     color: Theme.of(context).cardColor.withOpacity(1),
          //     child: Row(
          //       children: [
          //         Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             TextWidget(
          //               text: 'Total',
          //               color: Colors.red,
          //               textSize: 18,
          //               isTitle: true,
          //             ),
          //             Row(
          //               children: [
          //                 TextWidget(
          //                   text: '\$ 0.99',
          //                   color: color,
          //                   textSize: 18,
          //                   isTitle: true,
          //                 ),
          //                 TextWidget(
          //                   text: '/kg',
          //                   color: color,
          //                   textSize: 14,
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //         const Spacer(),
          //         Material(
          //           color: Colors.green,
          //           borderRadius: BorderRadius.circular(10),
          //           child: InkWell(
          //             borderRadius: BorderRadius.circular(10),
          //             onTap: () {},
          //             child: Padding(
          //               padding: const EdgeInsets.all(8.0),
          //               child: TextWidget(
          //                   text: 'In Cart', color: Colors.white, textSize: 20),
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // )
