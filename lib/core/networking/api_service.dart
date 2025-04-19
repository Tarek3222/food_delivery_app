import 'package:dio/dio.dart';
import 'package:food_delivery_app/core/networking/api_constants.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @GET(ApiConstants.popularProductEndpoint)
  Future<ProductsListModel> getPopularProductList();

  @GET(ApiConstants.recommendedProductEndpoint)
  Future<ProductsListModel> getRecommendedProductList();
}
