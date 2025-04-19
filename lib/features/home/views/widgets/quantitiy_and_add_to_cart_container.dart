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
import 'package:food_delivery_app/features/cart/logic/set_quantity_cubit/set_quantity_state.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:food_delivery_app/features/home/views/widgets/add_product_bloc_listener.dart';

class QuantityAndAddToCartContainer extends StatelessWidget {
  const QuantityAndAddToCartContainer({
    super.key,
    required this.popularModel,
  });

  final PopularProduct popularModel;

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
          Container(
            padding: const EdgeInsets.all(10).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20).w,
              color: Colors.white,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    context.read<SetQuantityCubit>().setQuantity(false);
                  },
                  child: const Icon(
                    Icons.remove,
                    color: AppColors.signColor,
                  ),
                ),
                horizontalSpace(5),
                BlocConsumer<SetQuantityCubit, SetQuantityState>(
                  buildWhen: (previous, current) =>
                      current is SetQuantityChanged,
                  listenWhen: (previous, current) =>
                      current is SetQuantityMax || current is SetQuantityMin,
                  listener: (context, state) {
                    if (state is SetQuantityMax) {
                      showTopSnackBar(
                          context, "You can't increase more than 20",
                          color: Colors.red);
                    } else if (state is SetQuantityMin) {
                      showTopSnackBar(context, "You can't reduce less than 0",
                          color: Colors.red);
                    }
                  },
                  builder: (context, state) {
                    return BigText(
                      text: "${context.read<SetQuantityCubit>().quantity}",
                      color: AppColors.mainBlackColor,
                    );
                  },
                ),
                horizontalSpace(5),
                InkWell(
                  onTap: () {
                    context.read<SetQuantityCubit>().setQuantity(true);
                  },
                  child: const Icon(
                    Icons.add,
                    color: AppColors.signColor,
                  ),
                ),
              ],
            ),
          ),
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
    if (context.read<SetQuantityCubit>().quantity == 0) {
      showTopSnackBar(context, "Please select quantity", color: Colors.red);
    } else {
      context.read<CartCubit>().addProductToCart(
          popularModel, context.read<SetQuantityCubit>().quantity);
    }
  }
}
