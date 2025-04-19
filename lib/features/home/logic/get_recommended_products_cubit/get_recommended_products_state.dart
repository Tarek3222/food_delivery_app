import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_recommended_products_state.freezed.dart';

@freezed
class GetRecommendedProductsState with _$GetRecommendedProductsState {
  const factory GetRecommendedProductsState.initial() = _Initial;
  const factory GetRecommendedProductsState.recommendedProductsLoading() =
      RecommendedProductsLoading;
  const factory GetRecommendedProductsState.recommendedProductsSuccess({
    required List<PopularProduct> recommendedProducts,
  }) = RecommendedProductsSuccess;
  const factory GetRecommendedProductsState.recommendedProductsError({
    required String errorMessage,
  }) = RecommendedProductsError;
}
