import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_popular_products_state.freezed.dart';

@freezed
class GetPopularProductsState with _$GetPopularProductsState {
  const factory GetPopularProductsState.initial() = _Initial;
  const factory GetPopularProductsState.popularProductsLoading() =
      PopularProductsLoading;
  const factory GetPopularProductsState.popularProductsSuccess({
    required List<ProductModel> popularProducts,
  }) = popularProductsSuccess;
  const factory GetPopularProductsState.popularProductsError({
    required String errorMessage,
  }) = popularProductsError;
}
