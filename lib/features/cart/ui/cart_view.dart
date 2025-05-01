// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/features/cart/ui/widgets/build_products_bloc_builder.dart';
import 'package:food_delivery_app/features/cart/ui/widgets/cart_app_bar.dart';
import 'package:food_delivery_app/features/cart/ui/widgets/cart_bottom_nav_bar.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';

class CartView extends StatelessWidget {
  const CartView(
      {super.key, required this.productModel, required this.productType});
  final ProductModel productModel;
  final String productType;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (productType == "popular") {
          Navigator.pushReplacementNamed(context, "/popularFoodDetails",
              arguments: productModel);
        } else {
          Navigator.pushReplacementNamed(context, "/recommendedFoodDetails",
              arguments: productModel);
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16).r,
                child: CartAppBar(
                  productModel: productModel,
                  productType: productType,
                ),
              ),
              const Expanded(
                child: BuildProductsBlocBuilder(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const CartBottomNavBar(),
      ),
    );
  }
}
