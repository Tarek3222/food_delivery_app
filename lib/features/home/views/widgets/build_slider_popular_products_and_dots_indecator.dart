import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/helpers/app_dimensions.dart';
import 'package:food_delivery_app/core/helpers/extensions.dart';
import 'package:food_delivery_app/core/routing/routes.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:food_delivery_app/features/home/logic/get_popular_products_cubit/get_popular_products_cubit.dart';
import 'package:food_delivery_app/features/home/logic/get_popular_products_cubit/get_popular_products_state.dart';
import 'package:food_delivery_app/features/home/views/widgets/build_dots_indicator.dart';
import 'package:food_delivery_app/features/home/views/widgets/build_page_view_item.dart';

class BuildSliderPopularProductsAndDotsIndecator extends StatefulWidget {
  const BuildSliderPopularProductsAndDotsIndecator({super.key});

  @override
  State<BuildSliderPopularProductsAndDotsIndecator> createState() =>
      _BuildSliderPopularProductsAndDotsIndecatorState();
}

class _BuildSliderPopularProductsAndDotsIndecatorState
    extends State<BuildSliderPopularProductsAndDotsIndecator> {
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
    return BlocBuilder<GetPopularProductsCubit, GetPopularProductsState>(
      buildWhen: (previous, current) =>
          current is PopularProductsLoading ||
          current is popularProductsSuccess ||
          current is popularProductsError,
      builder: (context, state) {
        if (state is PopularProductsLoading) {
          return setupLoading();
        } else if (state is popularProductsSuccess) {
          return setupSuccess(state, context);
        } else if (state is popularProductsError) {
          return setupError(state);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Column setupSuccess(popularProductsSuccess state, BuildContext context) {
    List<PopularProduct> popularProducts = state.popularProducts;
    return Column(
      children: [
        SizedBox(
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
        ),
        BuildDotsIndicator(
          dotsCount: popularProducts.length,
          currentPage: currentPageValue,
        ),
      ],
    );
  }

  Center setupLoading() {
    return const Center(child: CircularProgressIndicator());
  }

  Center setupError(popularProductsError state) {
    return Center(
      child: Text(
        state.errorMessage,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
