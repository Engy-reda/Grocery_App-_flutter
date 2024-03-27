import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/widgets/list_tiles.dart';
import 'package:grocery_app/widgets/price_widget.dart';

import '../services/utils.dart';
import 'custom_heart_bottom.dart';

class OnSalesWidget extends StatefulWidget {
  const OnSalesWidget({super.key});

  @override
  State<OnSalesWidget> createState() => _OnSalesWidgetState();
}

class _OnSalesWidgetState extends State<OnSalesWidget> {
  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    Color colorText = utils.color;
    return Material(
      color: Theme.of(context).cardColor.withOpacity(0.9),
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FancyShimmerImage(
                    imageUrl:
                        'https://img.freepik.com/free-photo/large-set-isolated-vegetables-white-background_485709-44.jpg?w=1480&t=st=1708434163~exp=1708434763~hmac=7f75afd2407d25f7b844ded71d349dc74a356fd8082c629f5a30aaadfdf27e53',
                    height: size.width * 0.22,
                    width: size.width * 0.22,
                    boxFit: BoxFit.fill,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Column(
                    children: [
                      TextWidget(
                        text: '1 KG',
                        color: colorText,
                        textSize: 22,
                        isTitle: true,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('pressed on bag');
                            },
                            child: Icon(
                              IconlyLight.bag2,
                              size: 22,
                              color: colorText,
                            ),
                          ),
                          const HeartButtom()
                        ],
                      )
                    ],
                  )
                ],
              ),
              PriceWidget(
                  salesPrice: 299, price: 5.9, textPrice: '1', isOnSales: true),
              const SizedBox(
                width: 5,
              ),
              TextWidget(
                text: 'Product title',
                color: colorText,
                textSize: 16,
                isTitle: true,
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
