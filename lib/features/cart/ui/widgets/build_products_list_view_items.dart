import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/cart/data/models/cart_model.dart';
import 'package:food_delivery_app/features/cart/ui/widgets/build_cart_item.dart';

class BuildProductsListViewItems extends StatelessWidget {
  const BuildProductsListViewItems({
    super.key,
    required this.products,
  });
  final List<CartModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return BuildCartItem(cartProduct: products[index]);
      },
    );
  }
}
