import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/routing/routes.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:food_delivery_app/features/home/views/widgets/recommended_products_widgets/build_recommended_list_view_item.dart';

class BuildRecommendedProductsListView extends StatelessWidget {
  const BuildRecommendedProductsListView({
    super.key,
    required this.recommendedProducts,
  });

  final List<ProductModel> recommendedProducts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.only(left: 20, right: 10).r,
      itemCount: recommendedProducts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.recommendedFoodDetails,
              arguments: recommendedProducts[index],
            );
          },
          child: BuildRecommendedListViewItem(
            recommendedProduct: recommendedProducts[index],
          ),
        );
      },
    );
  }
}
