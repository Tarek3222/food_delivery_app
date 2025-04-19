import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/extensions.dart';
import 'package:food_delivery_app/core/helpers/spaceing.dart';
import 'package:food_delivery_app/core/networking/api_constants.dart';
import 'package:food_delivery_app/core/routing/routes.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/app_icon.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:food_delivery_app/features/cart/logic/cart_cubit/cart_state.dart';
import 'package:food_delivery_app/features/cart/logic/set_quantity_cubit/set_quantity_cubit.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:food_delivery_app/features/home/views/widgets/column_food_info.dart';
import 'package:food_delivery_app/features/home/views/widgets/expandable_text.dart';
import 'package:food_delivery_app/features/home/views/widgets/popular_details_widgets/quantitiy_and_add_to_cart_container.dart';

class PopularFoodDetailsView extends StatelessWidget {
  final PopularProduct popularModel;
  const PopularFoodDetailsView({super.key, required this.popularModel});

  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().getNumberOfQuantity();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: 350.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "${ApiConstants.baseImageUrl}${popularModel.imageUrl}",
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios_new,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                BlocBuilder<CartCubit, CartState>(
                  buildWhen: (previous, current) =>
                      current is GetNumberOfQuantityState,
                  builder: (context, state) {
                    return AppIcon(
                      icon: Icons.shopping_cart,
                      child: Badge.count(
                        count: state is GetNumberOfQuantityState
                            ? state.totalQuantity
                            : 0,
                        backgroundColor: AppColors.mainColor,
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Color(0xFF756d54),
                          size: 20,
                        ),
                      ),
                      onPressed: () {
                        context.pushNamed(Routes.cartScreen);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 320.h,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ColumnFoodInfo(
                    title: popularModel.name ?? "Unknown",
                  ),
                  verticalSpace(20),
                  const BigText(text: "Introduce"),
                  verticalSpace(10),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: ExpandableText(
                          text: popularModel.description ?? "Unknown"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BlocProvider(
        create: (context) => SetQuantityCubit(),
        child: QuantityAndAddToCartContainer(popularModel: popularModel),
      ),
    );
  }
}
