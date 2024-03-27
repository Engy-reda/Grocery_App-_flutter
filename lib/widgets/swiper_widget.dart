import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../services/utils.dart';

class SwiperWidget extends StatelessWidget {
  SwiperWidget({super.key});
  final List<String> _offerImage = [
    'assets/images/offeres/Offer1.jpg',
    'assets/images/offeres/Offer2.jpg',
    'assets/images/offeres/Offer3.jpg',
    'assets/images/offeres/Offer4.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    Utils utils = Utils(context);
    final themeState = utils.getTheme;
    Size size = utils.getScreenSize;
    print(themeState);
    return SizedBox(
      height: size.height * 0.33,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.asset(
            _offerImage[index],
            fit: BoxFit.fill,
          );
        },
        autoplay: true,
        itemCount: _offerImage.length,
        pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: DotSwiperPaginationBuilder(
                color: Colors.white, activeColor: Colors.red)),
        control: SwiperControl(),
      ),
    );
  }
}
