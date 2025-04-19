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
            popularModel: settings.arguments as PopularProduct,
          ),
        );
      case Routes.recommendedFoodDetails:
        return MaterialPageRoute(
          builder: (_) => RecommendedFoodDetails(
            recommendedProduct: settings.arguments as PopularProduct,
          ),
        );
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => const CartView(),
        );

      default:
        return null;
    }
  }
}
