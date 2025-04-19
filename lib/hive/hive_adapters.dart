import 'package:food_delivery_app/features/cart/data/models/cart_model.dart';
import 'package:hive_ce/hive.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<CartModel>()])
// Annotations must be on some element
// ignore: unused_element
void _() {}
