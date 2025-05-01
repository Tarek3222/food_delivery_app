import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/extensions.dart';
import 'package:food_delivery_app/core/routing/routes.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/app_icon.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar(
      {super.key, required this.productModel, required this.productType});
  final ProductModel productModel;
  final String productType;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppIcon(
          icon: Icons.arrow_back_ios_new,
          onPressed: () {
            if (productType == "popular") {
              context.pushReplacementNamed(Routes.popularFoodDetails,
                  arguments: productModel);
            } else {
              context.pushReplacementNamed(Routes.recommendedFoodDetails,
                  arguments: productModel);
            }
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
          onPressed: () {
            context.pop();
          },
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
