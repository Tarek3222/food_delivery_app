import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/home/data/repos/recommended_product_repo.dart';

import 'get_recommended_products_state.dart';

class GetRecommendedProductsCubit extends Cubit<GetRecommendedProductsState> {
  final RecommendedProductRepo recommendedProductRepo;
  GetRecommendedProductsCubit(this.recommendedProductRepo)
      : super(const GetRecommendedProductsState.initial());

  Future<void> getRecommendedProducts() async {
    emit(const GetRecommendedProductsState.recommendedProductsLoading());
    final result = await recommendedProductRepo.getRecommendedProductList();
    result.fold(
      (error) => emit(GetRecommendedProductsState.recommendedProductsError(
          errorMessage: error.message ?? "Unknown error")),
      (productList) => emit(
        GetRecommendedProductsState.recommendedProductsSuccess(
          recommendedProducts: productList.products ?? [],
        ),
      ),
    );
  }
}
