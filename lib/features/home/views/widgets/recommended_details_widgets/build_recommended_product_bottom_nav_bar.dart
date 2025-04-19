import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/spaceing.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/core/widgets/custom_snackbar.dart';
import 'package:food_delivery_app/features/cart/data/local_services/hive_constants.dart';
import 'package:food_delivery_app/features/cart/data/local_services/hive_helper.dart';
import 'package:food_delivery_app/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:food_delivery_app/features/cart/logic/set_quantity_cubit/set_quantity_cubit.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:food_delivery_app/features/home/views/widgets/popular_details_widgets/add_product_bloc_listener.dart';
import 'package:food_delivery_app/features/home/views/widgets/recommended_details_widgets/recommended_product_price_and_two_buttons.dart';

class BuildRecommendedProductBottomNavBar extends StatelessWidget {
  const BuildRecommendedProductBottomNavBar({
    super.key,
    required this.recommendedProduct,
  });

  final PopularProduct recommendedProduct;

  @override
  Widget build(BuildContext context) {
    context.read<SetQuantityCubit>().quantity =
        HiveService.getCurrentProductQuantity(kCartBox, recommendedProduct.id!);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        RecommendedProductPriceAndTwoButtons(
            recommendedProduct: recommendedProduct),
        verticalSpace(10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30).r,
          height: 120.h,
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.r),
              topRight: Radius.circular(40.r),
            ),
            color: AppColors.buttonBackgroundColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(15).r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20).w,
                  color: Colors.white,
                ),
                child: Icon(Icons.favorite,
                    color: AppColors.mainColor, size: 24.h),
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setupAddNewProductToCart(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15).r,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20).w,
                        color: AppColors.mainColor,
                      ),
                      child: BigText(
                        text: "\$${recommendedProduct.price} | Add to cart",
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const AddProductBlocListener(),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  void setupAddNewProductToCart(BuildContext context) {
    if (context.read<SetQuantityCubit>().quantity == 0) {
      showTopSnackBar(context, "Please select quantity", color: Colors.red);
    } else {
      context.read<CartCubit>().addProductToCart(
          recommendedProduct, context.read<SetQuantityCubit>().quantity);
    }
  }
}
