import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery_app/widgets/list_tiles.dart';
import 'package:grocery_app/widgets/price_widget.dart';

import '../services/utils.dart';
import 'custom_heart_bottom.dart';

class FoodsWidgets extends StatefulWidget {
  const FoodsWidgets({super.key});

  @override
  State<FoodsWidgets> createState() => _FoodsWidgetsState();
}

class _FoodsWidgetsState extends State<FoodsWidgets> {
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
    Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    Color colorText = utils.color;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              SizedBox(
                height: 7,
              ),
              FancyShimmerImage(
                imageUrl:
                    'https://img.freepik.com/free-photo/large-set-isolated-vegetables-white-background_485709-44.jpg?w=1480&t=st=1708434163~exp=1708434763~hmac=7f75afd2407d25f7b844ded71d349dc74a356fd8082c629f5a30aaadfdf27e53',
                height: size.width * 0.21,
                width: size.width * 0.22,
                boxFit: BoxFit.fill,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: 'name product',
                      color: colorText,
                      textSize: 20,
                      isTitle: true,
                    ),
                    HeartButtom()
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      flex: 3,
                      child: PriceWidget(
                          salesPrice: 299,
                          price: 5.9,
                          textPrice: _quantityTextControler.text,
                          isOnSales: true),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Flexible(
                      child: Row(children: [
                        Flexible(
                          flex: 3,
                          child: FittedBox(
                            child: TextWidget(
                              text: 'kg',
                              color: colorText,
                              textSize: 18,
                              isTitle: true,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        Flexible(
                            flex: 2,
                            child: TextFormField(
                              onTap: () {
                                print(
                                    'thenumberis :${_quantityTextControler.text}');
                              },
                              controller: _quantityTextControler,
                              key: const ValueKey('10\$'),
                              style: TextStyle(color: colorText, fontSize: 18),
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              enabled: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.,]'))
                              ],
                            )),
                      ]),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: () {
                  print('add to cart');
                },
                child: TextWidget(
                  text: 'add to cart',
                  color: colorText,
                  textSize: 20,
                  maxLines: 1,
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Theme.of(context).cardColor),
                    tapTargetSize: MaterialTapTargetSize
                        .shrinkWrap, // shrinkWrap remove all padding
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
