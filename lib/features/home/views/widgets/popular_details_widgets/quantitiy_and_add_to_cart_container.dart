import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/spaceing.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/features/cart/data/local_services/hive_constants.dart';
import 'package:food_delivery_app/features/cart/data/local_services/hive_helper.dart';
import 'package:food_delivery_app/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:food_delivery_app/features/cart/logic/set_quantity_cubit/set_quantity_cubit.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:food_delivery_app/features/home/views/widgets/popular_details_widgets/add_product_bloc_listener.dart';
import 'package:food_delivery_app/features/home/views/widgets/popular_details_widgets/build_add_remove_quantity_buttons.dart';

class QuantityAndAddToCartContainer extends StatelessWidget {
  const QuantityAndAddToCartContainer({
    super.key,
    required this.popularModel,
  });

  final ProductModel popularModel;

  @override
  Widget build(BuildContext context) {
    context.read<SetQuantityCubit>().quantity =
        HiveService.getCurrentProductQuantity(kCartBox, popularModel.id!);
    return Container(
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
          const BuildAddRemoveQuantityButtons(),
          horizontalSpace(10),
          const AddProductBlocListener(),
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
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: BigText(
                  text: "\$${popularModel.price?.round()} | Add to cart",
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void setupAddNewProductToCart(BuildContext context) {
    context.read<CartCubit>().addProductToCart(
        popularModel, context.read<SetQuantityCubit>().quantity);
  }
}
