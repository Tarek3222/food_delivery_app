import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/extensions.dart';
import 'package:food_delivery_app/core/networking/api_constants.dart';
import 'package:food_delivery_app/core/routing/routes.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/app_icon.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:food_delivery_app/features/cart/logic/cart_cubit/cart_state.dart';
import 'package:food_delivery_app/features/cart/logic/set_quantity_cubit/set_quantity_cubit.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:food_delivery_app/features/home/views/widgets/build_recommended_product_bottom_nav_bar.dart';
import 'package:food_delivery_app/features/home/views/widgets/expandable_text.dart';

class RecommendedFoodDetails extends StatelessWidget {
  const RecommendedFoodDetails({super.key, required this.recommendedProduct});
  final PopularProduct recommendedProduct;

  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().getNumberOfQuantity();
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300.h,
            automaticallyImplyLeading: false,
            pinned: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    icon: Icons.clear,
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                BlocBuilder<CartCubit, CartState>(
                  buildWhen: (previous, current) =>
                      current is GetNumberOfQuantityState,
                  builder: (context, state) {
                    return AppIcon(
                      icon: Icons.shopping_cart,
                      child: Badge.count(
                        count: context.read<CartCubit>().totalQuantity,
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
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl:
                    "${ApiConstants.baseImageUrl}${recommendedProduct.imageUrl}",
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50.h),
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.r),
                    topRight: Radius.circular(40.r),
                  ),
                ),
                child: BigText(
                    text: recommendedProduct.name ?? "Food Name",
                    color: Colors.black,
                    size: 24),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20).r,
              child: ExpandableText(
                text: recommendedProduct.description ??
                    "Description not available",
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BlocProvider(
        create: (context) => SetQuantityCubit(),
        child: BuildRecommendedProductBottomNavBar(
            recommendedProduct: recommendedProduct),
      ),
    );
  }
}
