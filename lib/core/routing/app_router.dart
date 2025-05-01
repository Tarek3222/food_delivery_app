import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/routing/routes.dart';
import 'package:food_delivery_app/features/cart/ui/cart_view.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:food_delivery_app/features/home/views/main_food_view.dart';
import 'package:food_delivery_app/features/home/views/popular_food_details_view.dart';
import 'package:food_delivery_app/features/home/views/recommended_food_details.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const MainFoodView(),
        );
      case Routes.popularFoodDetails:
        return MaterialPageRoute(
          builder: (_) => PopularFoodDetailsView(
            popularModel: settings.arguments as ProductModel,
          ),
        );
      case Routes.recommendedFoodDetails:
        return MaterialPageRoute(
          builder: (_) => RecommendedFoodDetails(
            recommendedProduct: settings.arguments as ProductModel,
          ),
        );
      case Routes.cartScreen:
        var data = settings.arguments as Map<String, dynamic>;

        return MaterialPageRoute(
          builder: (_) => CartView(
            productModel: data['productModel'] as ProductModel,
            productType: data['productType'] as String,
          ),
        );

      default:
        return null;
    }
  }
}
