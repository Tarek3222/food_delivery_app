import 'package:food_delivery_app/core/networking/api_error_handler.dart';
import 'package:food_delivery_app/core/networking/api_error_model.dart';
import 'package:food_delivery_app/core/networking/api_service.dart';
import 'package:dartz/dartz.dart';

import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';

class PopularProductRepo {
  final ApiService apiService;
  PopularProductRepo({required this.apiService});

  Future<Either<ApiErrorModel, ProductsListModel>>
      getPopularProductList() async {
    try {
      ProductsListModel response = await apiService.getPopularProductList();
      return Right(response);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
