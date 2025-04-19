import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/helpers/app_dimensions.dart';
import 'package:food_delivery_app/core/helpers/extensions.dart';
import 'package:food_delivery_app/core/routing/routes.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:food_delivery_app/features/home/views/widgets/popular_products_slider_widgets/build_page_view_item.dart';

class SliderPopularProductsPageView extends StatelessWidget {
  const SliderPopularProductsPageView({
    super.key,
    required this.pageController,
    required this.currentPageValue,
    required this.popularProducts,
  });

  final PageController pageController;
  final double currentPageValue;
  final List<PopularProduct> popularProducts;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimensions.pageView(context),
      child: PageView.builder(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        itemCount: popularProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.pushNamed(Routes.popularFoodDetails,
                  arguments: popularProducts[index]);
            },
            child: BuildPageViewItem(
              index: index,
              popularProduct: popularProducts[index],
              currentPageValue: currentPageValue,
            ),
          );
        },
      ),
    );
  }
}
