import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/app_icon.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppIcon(
          icon: Icons.arrow_back_ios_new,
          onPressed: () {
            Navigator.pop(context);
          },
          iconColor: Colors.white,
          backgroundColor: AppColors.mainColor,
          size: 24.h,
        ),
        const Spacer(
          flex: 5,
        ),
        AppIcon(
          icon: Icons.home,
          onPressed: () {},
          iconColor: Colors.white,
          backgroundColor: AppColors.mainColor,
          size: 24.h,
        ),
        const Spacer(),
        AppIcon(
          icon: Icons.shopping_cart,
          onPressed: () {},
          iconColor: Colors.white,
          backgroundColor: AppColors.mainColor,
          size: 24.h,
        ),
      ],
    );
  }
}
