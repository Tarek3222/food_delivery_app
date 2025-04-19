import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/core/widgets/small_text.dart';

class MainFoodTopBar extends StatelessWidget {
  const MainFoodTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15).r,
      child: Row(
        children: [
          const Column(
            children: [
              BigText(
                text: "Egypt",
                color: AppColors.mainColor,
              ),
              Row(
                children: [
                  SmallText(
                    text: "City",
                    color: Colors.black54,
                  ),
                  Icon(
                    Icons.arrow_drop_down,
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: 45.w,
            height: 45.h,
            decoration: BoxDecoration(
              color: AppColors.mainColor,
              borderRadius: BorderRadius.circular(15.r),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFe8e8e8),
                  blurRadius: 10.0,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: Icon(
              Icons.search,
              color: Colors.white,
              size: 20.h,
            ),
          ),
        ],
      ),
    );
  }
}
