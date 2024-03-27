import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/inner_screen/food_screen.dart';
import 'package:grocery_app/screens/cart/empty_screen.dart';
import 'package:grocery_app/services/global_method.dart';
import 'package:grocery_app/widgets/custom_heart_bottom.dart';
import 'package:grocery_app/widgets/list_tiles.dart';

import '../../services/utils.dart';

class WishListWidget extends StatelessWidget {
  const WishListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    Color colorText = utils.color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          GlobalMethod.navigateTo(
              ctx: context, routeName: EmptyScreen.routeEmptyScreen);
        },
        child: Container(
          height: size.height * 0.20,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.5),
              border: Border.all(color: colorText, width: 0.5),
              borderRadius: BorderRadius.circular(8.0)),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8),
                width: size.width * 0.2,
                height: size.width * 0.25,
                child: Image.asset(
                  'assets/images/cat/Spinach.png',
                  fit: BoxFit.scaleDown,
                  // width: size.width * 0.5,
                ),
              ),
              Column(
                children: [
                  Flexible(
                    child: const Row(
                      children: [Icon(IconlyLight.bag2), HeartButtom()],
                    ),
                  ),
                  Flexible(
                      child: TextWidget(
                    text: 'Pass',
                    color: colorText,
                    textSize: 20,
                    maxLines: 2,
                  )),
                  const SizedBox(
                    height: 5,
                  ),
                  TextWidget(text: '\$2.99', color: colorText, textSize: 18)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
