import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:food_delivery_app/features/home/logic/get_popular_products_cubit/get_popular_products_cubit.dart';
import 'package:food_delivery_app/features/home/logic/get_popular_products_cubit/get_popular_products_state.dart';
import 'package:food_delivery_app/features/home/views/widgets/popular_products_slider_widgets/slider_popular_products_page_view_and_dots_indecator.dart';

class SliderPopularProductsBlocBuilder extends StatelessWidget {
  const SliderPopularProductsBlocBuilder({super.key});

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

  Widget setupSuccess(popularProductsSuccess state, BuildContext context) {
    List<PopularProduct> popularProducts = state.popularProducts;
    return SliderPopularProductsPageViewAndDotsIndecator(
      popularProducts: popularProducts,
    );
  }

  Widget setupLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget setupError(popularProductsError state) {
    return Center(
      child: BigText(
        text: state.errorMessage,
        color: Colors.red,
      ),
    );
  }
}
