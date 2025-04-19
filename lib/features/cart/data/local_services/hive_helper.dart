import 'package:food_delivery_app/features/cart/data/models/cart_model.dart';
import 'package:food_delivery_app/hive/hive_registrar.g.dart';
import 'package:hive_ce/hive.dart';

class HiveService {
  static void init(String path) {
    Hive
      ..init(path)
      ..registerAdapters();
  }

  /// create a box
  static Future<Box> openBox(String boxName) async {
    return await Hive.openBox<CartModel>(boxName);
  }

  // get the box
  static Box getBox(String boxName) {
    return Hive.box<CartModel>(boxName);
  }

  /// Save data with a key
  static Future<void> addItemInCart(String boxName, CartModel cartItem) async {
    final box = getBox(boxName);
    await box.add(cartItem);
  }

  /// Read data with a key
  static List<CartModel> getItemsInCart<T>(String boxName) {
    final box = getBox(boxName);
    return box.values.cast<CartModel>().toList();
  }

  /// Clear all data in a box
  static Future<void> clearBox(String boxName) async {
    final box = getBox(boxName);
    await box.clear();
  }

  /// Close box (optional cleanup)
  static Future<void> closeBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      final box = Hive.box(boxName);
      await box.close();
    }
  }

  // get the currnet product from the cart
  static int getCurrentProductQuantity(String boxName, int id) {
    List<CartModel> cartProducts = getItemsInCart<CartModel>(boxName);
    if (cartProducts.isNotEmpty) {
      for (var product in cartProducts) {
        if (product.id == id) {
          return product.quantity!;
        }
      }
      return 0;
    } else {
      return 0;
    }
  }
}
