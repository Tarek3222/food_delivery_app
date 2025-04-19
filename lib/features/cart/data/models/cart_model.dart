import 'package:hive_ce/hive.dart';

class CartModel extends HiveObject {
  int? id;
  String? name;
  double? price;
  String? imageUrl;
  int? quantity;
  String? time;
  bool? isExist;

  CartModel(
      {this.id,
      this.name,
      this.price,
      this.imageUrl,
      this.quantity,
      this.time,
      this.isExist});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      quantity: json['quantity'],
      time: json['time'],
      isExist: json['isExist'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['imageUrl'] = imageUrl;
    data['quantity'] = quantity;
    data['time'] = time;
    data['isExist'] = isExist;
    return data;
  }
}
