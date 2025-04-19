import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/spaceing.dart';
import 'package:food_delivery_app/core/widgets/small_text.dart';

class IconAndText extends StatelessWidget {
  const IconAndText(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.text});
  final IconData icon;
  final Color iconColor;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
          size: 20.h,
        ),
        horizontalSpace(5),
        SmallText(
          text: text,
        ),
      ],
    );
  }
}
