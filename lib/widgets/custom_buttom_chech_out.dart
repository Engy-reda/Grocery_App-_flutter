import 'package:flutter/material.dart';
import 'package:grocery_app/widgets/list_tiles.dart';

import '../services/utils.dart';

class CustomButtomCheckOut extends StatelessWidget {
  const CustomButtomCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Size size = Utils(context).getScreenSize;
    Color colorText = utils.color;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: size.width * 0.1,
        child: Row(children: [
          Material(
            color: Colors.green,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextWidget(
                    text: 'Order Now', color: Colors.white, textSize: 20),
              ),
            ),
          ),
          const Spacer(),
          FittedBox(
            child: TextWidget(
                text: 'Total: \$0.259', color: colorText, textSize: 18),
          )
        ]),
      ),
    );
  }
}
