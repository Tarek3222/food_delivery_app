import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:food_delivery_app/features/home/views/widgets/popular_products_slider_widgets/build_dots_indicator.dart';
import 'package:food_delivery_app/features/home/views/widgets/popular_products_slider_widgets/slider_popular_products_page_view.dart';

class SliderPopularProductsPageViewAndDotsIndecator extends StatefulWidget {
  const SliderPopularProductsPageViewAndDotsIndecator(
      {super.key, required this.popularProducts});
  final List<PopularProduct> popularProducts;

  @override
  State<SliderPopularProductsPageViewAndDotsIndecator> createState() =>
      _SliderPopularProductsPageViewAndDotsIndecatorState();
}

class _SliderPopularProductsPageViewAndDotsIndecatorState
    extends State<SliderPopularProductsPageViewAndDotsIndecator> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var currentPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentPageValue = pageController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderPopularProductsPageView(
          pageController: pageController,
          popularProducts: widget.popularProducts,
          currentPageValue: currentPageValue,
        ),
        BuildDotsIndicator(
          dotsCount: widget.popularProducts.length,
          currentPage: currentPageValue,
        ),
      ],
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
