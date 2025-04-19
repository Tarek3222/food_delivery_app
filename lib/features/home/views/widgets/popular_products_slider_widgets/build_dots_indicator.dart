import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';

class BuildDotsIndicator extends StatelessWidget {
  const BuildDotsIndicator(
      {super.key, required this.currentPage, required this.dotsCount});
  final double currentPage;
  final int dotsCount;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: dotsCount,
      position: currentPage,
      decorator: const DotsDecorator(
        activeColor: AppColors.mainColor,
        size: Size.square(9.0),
        activeSize: Size(18.0, 9.0),
        spacing: EdgeInsets.symmetric(horizontal: 3.0),
        color: Colors.grey,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
      ),
    );
  }
}
