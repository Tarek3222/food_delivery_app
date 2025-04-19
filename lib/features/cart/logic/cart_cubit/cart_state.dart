import 'package:food_delivery_app/features/cart/data/models/cart_model.dart';

class CartState {
  const CartState();
}

class CartInitial extends CartState {}

// add Product to Cart state
class AddProductToCartLoading extends CartState {}

class AddProductToCartSuccess extends CartState {}

class AddProductToCartExist extends CartState {
  final String message;

  AddProductToCartExist(this.message);
}

class AddProductToCartError extends CartState {
  final String error;

  AddProductToCartError(this.error);
}

// get products from cart state
class GetProductsFromCartLoading extends CartState {}

class GetProductsFromCartSuccess extends CartState {
  final List<CartModel> cartProducts;

  GetProductsFromCartSuccess(this.cartProducts);
}

class GetProductsFromCartEmpty extends CartState {}

class GetProductsFromCartError extends CartState {
  final String error;
  GetProductsFromCartError(this.error);
}

// Number of Quantity state
class GetNumberOfQuantityState extends CartState {
  final int totalQuantity;

  const GetNumberOfQuantityState(this.totalQuantity);
}
