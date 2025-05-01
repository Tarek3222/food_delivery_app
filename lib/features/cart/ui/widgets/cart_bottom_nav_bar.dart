import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/spaceing.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:food_delivery_app/features/cart/logic/cart_cubit/cart_state.dart';

class CartBottomNavBar extends StatefulWidget {
  const CartBottomNavBar({super.key});

  @override
  State<CartBottomNavBar> createState() => _CartBottomNavBarState();
}

class _CartBottomNavBarState extends State<CartBottomNavBar> {
  @override
  void initState() {
    context.read<CartCubit>().getTotalPrice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            child: BlocBuilder<CartCubit, CartState>(
              buildWhen: (previous, current) => current is GetTotalPriceState,
              builder: (context, state) {
                return BigText(
                  text: "\$${context.read<CartCubit>().totalPriceForCart}",
                  color: AppColors.mainBlackColor,
                );
              },
            ),
          ),
          horizontalSpace(10),
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(15).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).w,
                color: AppColors.mainColor,
              ),
              child: const BigText(
                text: "CheckNow",
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
