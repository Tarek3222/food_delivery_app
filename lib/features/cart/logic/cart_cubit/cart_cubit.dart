import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/cart/data/local_services/hive_constants.dart';
import 'package:food_delivery_app/features/cart/data/local_services/hive_helper.dart';
import 'package:food_delivery_app/features/cart/data/models/cart_model.dart';
import 'package:food_delivery_app/features/cart/logic/cart_cubit/cart_state.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  int _totalQuantity = 0;
  int get totalQuantity => _totalQuantity;
  // add Product to Cart
  Future<void> addProductToCart(PopularProduct product, int quantity) async {
    emit(AddProductToCartLoading());
    try {
      List<CartModel> cartProducts = HiveService.getItemsInCart(kCartBox);
      bool isProductInCart = cartProducts.any((item) => item.id == product.id);
      if (isProductInCart) {
        CartModel existingProduct =
            cartProducts.firstWhere((item) => item.id == product.id);
        existingProduct.quantity = quantity;
        existingProduct.time = DateTime.now().toString();
        existingProduct.save();
        getNumberOfQuantity();
        emit(AddProductToCartExist(
            "Product already exists in cart and quantity updated"));
      } else {
        CartModel cartItem = CartModel(
          id: product.id,
          name: product.name,
          imageUrl: product.imageUrl,
          price: product.price,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
        await HiveService.addItemInCart(kCartBox, cartItem);
        getNumberOfQuantity();
        emit(AddProductToCartSuccess());
      }
    } catch (e) {
      emit(AddProductToCartError(e.toString()));
    }
  }

  // get products from cart
  void getProductsFromCart() {
    emit(GetProductsFromCartLoading());
    try {
      List<CartModel> cartProducts = HiveService.getItemsInCart(kCartBox);
      if (cartProducts.isEmpty) {
        emit(GetProductsFromCartEmpty());
      } else {
        emit(GetProductsFromCartSuccess(cartProducts));
      }
    } catch (e) {
      emit(GetProductsFromCartError(e.toString()));
    }
  }

  // get number of quantity
  void getNumberOfQuantity() {
    List<CartModel> cartProducts = HiveService.getItemsInCart(kCartBox);
    _totalQuantity = cartProducts.fold(
        0, (previousValue, element) => previousValue + element.quantity!);
    emit(GetNumberOfQuantityState(_totalQuantity));
  }
}
