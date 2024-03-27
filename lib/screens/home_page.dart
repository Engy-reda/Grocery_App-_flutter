import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:grocery_app/inner_screen/food_screen.dart';
import 'package:grocery_app/inner_screen/on_sales_screen.dart';
import 'package:grocery_app/services/utils.dart';
import 'package:grocery_app/widgets/list_tiles.dart';
import 'package:grocery_app/widgets/on_sales_widget.dart';
import 'package:grocery_app/widgets/swiper_widget.dart';

import '../services/global_method.dart';
import '../widgets/foods_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    Size size = utils.getScreenSize;
    Color colorText = utils.color;
    // GlobalMethod globalMethod = GlobalMethod();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SwiperWidget(),
            const SizedBox(
              height: 5,
            ),
            TextButton(
                onPressed: () {
                  GlobalMethod.navigateTo(
                      ctx: context,
                      routeName: OnSalesScreen.routeNameOnSalesScreen);
                  print('View All');
                },
                child: TextWidget(
                  text: 'View All',
                  color: Colors.blue,
                  textSize: 20,
                  isTitle: true,
                )),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(children: [
                    TextWidget(
                      text: 'on sales'.toUpperCase(),
                      color: Colors.red,
                      textSize: 22,
                      isTitle: true,
                    ),
                    const Icon(
                      IconlyLight.discount,
                      color: Colors.red,
                    )
                  ]),
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.24,
                    child: ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const OnSalesWidget();
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: '  our product',
                  color: colorText,
                  textSize: 22,
                  isTitle: true,
                ),
                // const Spacer(),
                TextButton(
                    onPressed: () {
                      GlobalMethod.navigateTo(
                          ctx: context,
                          routeName: FoodsScreen.routeNameFoodsScreen);
                    },
                    child: TextWidget(
                      text: 'Browse all',
                      color: Colors.blue,
                      textSize: 20,
                      maxLines: 1,
                    )),
              ],
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: size.width / (size.height * 0.7),
              children: List.generate(4, (index) {
                return const FoodsWidgets();
              }),
            )
          ],
        ),
      ),
    );
  }
}
