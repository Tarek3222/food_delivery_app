import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/cart/logic/set_quantity_cubit/set_quantity_state.dart';

class SetQuantityCubit extends Cubit<SetQuantityState> {
  SetQuantityCubit() : super(const SetQuantityInitial());

  int quantity = 0;

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      if (quantity < 20) {
        quantity++;
        emit(SetQuantityChanged(quantity));
      } else {
        emit(SetQuantityMax());
      }
    } else {
      if (quantity > 0) {
        quantity--;
        emit(SetQuantityChanged(quantity));
      } else {
        emit(SetQuantityMin());
      }
    }
  }
}
