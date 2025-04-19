import 'package:dio/dio.dart';
import 'package:food_delivery_app/core/networking/api_service.dart';
import 'package:food_delivery_app/core/networking/dio_factory.dart';
import 'package:food_delivery_app/features/home/data/repos/popular_product_repo.dart';
import 'package:food_delivery_app/features/home/data/repos/recommended_product_repo.dart';
import 'package:food_delivery_app/features/home/logic/get_popular_products_cubit/get_popular_products_cubit.dart';
import 'package:food_delivery_app/features/home/logic/get_recommended_products_cubit/get_recommended_products_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio),
  );

  // get popular product repo
  getIt.registerLazySingleton<PopularProductRepo>(
    () => PopularProductRepo(apiService: getIt<ApiService>()),
  );
  // get popular product cubit
  getIt.registerFactory(
    () => GetPopularProductsCubit(getIt<PopularProductRepo>()),
  );

  // get recommended product repo
  getIt.registerLazySingleton<RecommendedProductRepo>(
    () => RecommendedProductRepo(apiService: getIt<ApiService>()),
  );
  // get recommended product cubit
  getIt.registerFactory(
    () => GetRecommendedProductsCubit(getIt<RecommendedProductRepo>()),
  );
}
