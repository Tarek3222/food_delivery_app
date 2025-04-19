import 'package:food_delivery_app/features/home/data/repos/popular_product_repo.dart';
import 'package:food_delivery_app/features/home/logic/get_popular_products_cubit/get_popular_products_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetPopularProductsCubit extends Cubit<GetPopularProductsState> {
  GetPopularProductsCubit(this.popularProductRepo)
      : super(const GetPopularProductsState.initial());
  final PopularProductRepo popularProductRepo;

  Future<void> getPopularProducts() async {
    emit(const GetPopularProductsState.popularProductsLoading());
    final result = await popularProductRepo.getPopularProductList();
    result.fold(
      (error) => emit(GetPopularProductsState.popularProductsError(
          errorMessage: error.message ?? "Unknown error")),
      (productList) => emit(
        GetPopularProductsState.popularProductsSuccess(
          popularProducts: productList.products ?? [],
        ),
      ),
    );
  }
}
