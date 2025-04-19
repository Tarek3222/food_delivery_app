import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/routing/routes.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:food_delivery_app/features/home/logic/get_recommended_products_cubit/get_recommended_products_cubit.dart';
import 'package:food_delivery_app/features/home/logic/get_recommended_products_cubit/get_recommended_products_state.dart';
import 'package:food_delivery_app/features/home/views/widgets/build_recommended_list_view_item.dart';

class BuildRecommendProductsListView extends StatelessWidget {
  const BuildRecommendProductsListView({super.key});

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

  ListView setupSuccess(RecommendedProductsSuccess state) {
    List<PopularProduct> recommendedProducts = state.recommendedProducts;
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

  Center setupError(RecommendedProductsError state) {
    return Center(
      child: Text(
        state.errorMessage,
        style: TextStyle(fontSize: 16.sp, color: Colors.red),
      ),
    );
  }

  Center setupLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
