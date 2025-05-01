import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/spaceing.dart';
import 'package:food_delivery_app/core/networking/api_constants.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/core/widgets/small_text.dart';
import 'package:food_delivery_app/features/cart/data/models/cart_model.dart';
import 'package:food_delivery_app/features/cart/ui/widgets/build_inrease_and_decrease_container.dart';

class BuildCartItem extends StatelessWidget {
  const BuildCartItem({
    super.key,
    required this.cartProduct,
  });

  final CartModel cartProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10, left: 16, right: 10).r,
      child: Row(
        children: [
          SizedBox(
            height: 100.h,
            width: 100.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20).w,
              child: CachedNetworkImage(
                imageUrl: "${ApiConstants.baseImageUrl}${cartProduct.imageUrl}",
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.mainColor,
                  ),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(
                    Icons.error,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
            ),
          ),
          horizontalSpace(10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(
                  text: cartProduct.name ?? "",
                ),
                const SmallText(
                  text: "spicy",
                  size: 14,
                ),
                Row(
                  children: [
                    BigText(
                      text: "\$${cartProduct.price}",
                      color: Colors.red,
                      size: 18,
                    ),
                    const Spacer(),
                    BuildInreaseAndDecreaseContainer(
                      cartProduct: cartProduct,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
