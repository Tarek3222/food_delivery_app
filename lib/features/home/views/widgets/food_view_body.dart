import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/di/dependancy_injection.dart';
import 'package:food_delivery_app/core/helpers/spaceing.dart';
import 'package:food_delivery_app/features/home/logic/get_popular_products_cubit/get_popular_products_cubit.dart';
import 'package:food_delivery_app/features/home/logic/get_recommended_products_cubit/get_recommended_products_cubit.dart';
import 'package:food_delivery_app/features/home/views/widgets/build_recommend_products_list_view.dart';
import 'package:food_delivery_app/features/home/views/widgets/build_slider_popular_products_and_dots_indecator.dart';
import 'package:food_delivery_app/features/home/views/widgets/recommended_text.dart';

class FoodViewBody extends StatelessWidget {
  const FoodViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider(
          create: (context) =>
              getIt<GetPopularProductsCubit>()..getPopularProducts(),
          child: const BuildSliderPopularProductsAndDotsIndecator(),
        ),
        verticalSpace(30),
        const RecommendedText(),
        verticalSpace(30),
        BlocProvider(
          create: (context) =>
              getIt<GetRecommendedProductsCubit>()..getRecommendedProducts(),
          child: const BuildRecommendProductsListView(),
        ),
      ],
    );
  }
}
