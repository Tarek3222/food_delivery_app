import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/spaceing.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/features/cart/data/models/cart_model.dart';
import 'package:food_delivery_app/features/cart/logic/cart_cubit/cart_cubit.dart';

class BuildInreaseAndDecreaseContainer extends StatelessWidget {
  const BuildInreaseAndDecreaseContainer(
      {super.key, required this.cartProduct});
  final CartModel cartProduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).w,
        color: Colors.grey[200],
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              if (cartProduct.quantity! > 1) {
                int newQuantity = cartProduct.quantity! - 1;
                cartProduct.quantity = newQuantity;
                cartProduct.save();
                context.read<CartCubit>().getProductsFromCart();
              } else {
                cartProduct.delete();
                context.read<CartCubit>().getProductsFromCart();
              }
              context.read<CartCubit>().getNumberOfQuantity();
              context.read<CartCubit>().getTotalPrice();
            },
            child: const Icon(
              Icons.remove,
              color: AppColors.signColor,
            ),
          ),
          horizontalSpace(5),
          BigText(
            text: "${cartProduct.quantity}",
            color: AppColors.mainBlackColor,
          ),
          horizontalSpace(5),
          InkWell(
            onTap: () {
              if (cartProduct.quantity! < 20) {
                int newQuantity = cartProduct.quantity! + 1;
                cartProduct.quantity = newQuantity;
                cartProduct.save();
                context.read<CartCubit>().getProductsFromCart();
                context.read<CartCubit>().getNumberOfQuantity();
                context.read<CartCubit>().getTotalPrice();
              }
            },
            child: const Icon(
              Icons.add,
              color: AppColors.signColor,
            ),
          ),
        ],
      ),
    );
  }
}
