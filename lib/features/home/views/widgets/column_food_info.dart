import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/spaceing.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/core/widgets/icon_and_text.dart';
import 'package:food_delivery_app/core/widgets/small_text.dart';

class ColumnFoodInfo extends StatelessWidget {
  const ColumnFoodInfo({super.key, required this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: title ?? "Food Title",
          size: 26.sp,
        ),
        verticalSpace(5),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15.h,
                ),
              ),
            ),
            horizontalSpace(10),
            const SmallText(
              text: "4.5",
            ),
            horizontalSpace(10),
            const SmallText(
              text: "1287",
            ),
            horizontalSpace(10),
            const SmallText(
              text: "Comments",
            ),
          ],
        ),
        verticalSpace(20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndText(
              icon: Icons.circle_sharp,
              iconColor: AppColors.iconColor1,
              text: "Normal",
            ),
            IconAndText(
              icon: Icons.location_on,
              iconColor: AppColors.mainColor,
              text: "1.7km",
            ),
            IconAndText(
              icon: Icons.access_time_rounded,
              iconColor: AppColors.iconColor2,
              text: "32min",
            ),
          ],
        ),
      ],
    );
  }
}
