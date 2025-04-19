import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/features/cart/ui/widgets/build_products_bloc_builder.dart';
import 'package:food_delivery_app/features/cart/ui/widgets/cart_app_bar.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16).r,
              child: const CartAppBar(),
            ),
            const Expanded(
              child: BuildProductsBlocBuilder(),
            ),
          ],
        ),
      ),
    );
  }
}
