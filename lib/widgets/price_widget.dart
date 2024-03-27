import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/list_tiles.dart';

import '../services/utils.dart';

class PriceWidget extends StatelessWidget {
  PriceWidget(
      {super.key,
      required this.salesPrice,
      required this.price,
      required this.textPrice,
      required this.isOnSales});
  final double salesPrice, price;

  final String textPrice;
  final bool isOnSales;
  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    Color colorText = utils.color;
    double userPrice = isOnSales ? salesPrice : price;
    return FittedBox(
      child: Row(
        children: [
          TextWidget(
              text:
                  '\$${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}',
              color: Colors.green,
              textSize: 18),
          const SizedBox(
            width: 5,
          ),
          Visibility(
            visible: isOnSales ? true : false,
            child: Text(
              '\$${(price * int.parse(textPrice)).toStringAsFixed(2)}',
              style: TextStyle(
                  color: colorText,
                  fontSize: 14,
                  decoration: TextDecoration.lineThrough),
            ),
          )
        ],
      ),
    );
  }
}
