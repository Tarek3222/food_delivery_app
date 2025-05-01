import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:food_delivery_app/features/home/logic/get_recommended_products_cubit/get_recommended_products_cubit.dart';
import 'package:food_delivery_app/features/home/logic/get_recommended_products_cubit/get_recommended_products_state.dart';
import 'package:food_delivery_app/features/home/views/widgets/recommended_products_widgets/build_recommended_products_list_view.dart';

class BuildRecommendedProductsBlocBuilder extends StatelessWidget {
  const BuildRecommendedProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetRecommendedProductsCubit,
        GetRecommendedProductsState>(
      buildWhen: (previous, current) =>
          current is RecommendedProductsError ||
          current is RecommendedProductsLoading ||
          current is RecommendedProductsSuccess,
      builder: (context, state) {
        if (state is RecommendedProductsLoading) {
          return setupLoading();
        } else if (state is RecommendedProductsError) {
          return setupError(state);
        } else if (state is RecommendedProductsSuccess) {
          return setupSuccess(state);
        }
        return const SizedBox.shrink();
      },
    );
  }

  Widget setupSuccess(RecommendedProductsSuccess state) {
    List<ProductModel> recommendedProducts = state.recommendedProducts;
    return BuildRecommendedProductsListView(
        recommendedProducts: recommendedProducts);
  }

  Center setupError(RecommendedProductsError state) {
    return Center(
      child: BigText(
        text: state.errorMessage,
        color: Colors.red,
      ),
    );
  }

  Center setupLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
