import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../services/utils.dart';

class HeartButtom extends StatelessWidget {
  const HeartButtom({super.key});

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    Color colorText = utils.color;
    return GestureDetector(
      onTap: () {
        print('pressed on heart');
      },
      child: Icon(
        IconlyLight.heart,
        size: 22,
        color: colorText,
      ),
    );
  }
}
