abstract class SetQuantityState {
  const SetQuantityState();
}

class SetQuantityInitial extends SetQuantityState {
  const SetQuantityInitial();
}

class SetQuantityChanged extends SetQuantityState {
  final int quantity;
  const SetQuantityChanged(this.quantity);
}

class SetQuantityMax extends SetQuantityState {}

class SetQuantityMin extends SetQuantityState {}
