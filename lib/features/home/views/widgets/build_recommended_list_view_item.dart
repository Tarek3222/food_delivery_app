import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/spaceing.dart';
import 'package:food_delivery_app/core/networking/api_constants.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/core/widgets/icon_and_text.dart';
import 'package:food_delivery_app/core/widgets/small_text.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';

class BuildRecommendedListViewItem extends StatelessWidget {
  const BuildRecommendedListViewItem(
      {super.key, required this.recommendedProduct});
  final PopularProduct recommendedProduct;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10).r,
      child: Row(
        children: [
          Container(
            width: 125.w,
            height: 140.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).w,
              color: Colors.white38,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  "${ApiConstants.baseImageUrl}${recommendedProduct.imageUrl}",
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 120.h,
              padding: const EdgeInsets.all(10).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: const Radius.circular(20).w,
                  bottomRight: const Radius.circular(20).w,
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: recommendedProduct.name ?? "Unknown",
                  ),
                  verticalSpace(10),
                  const SmallText(
                    text: "With Nutella and cheese",
                  ),
                  verticalSpace(10),
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}
