import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/di/dependancy_injection.dart';
import 'package:food_delivery_app/core/routing/app_router.dart';
import 'package:food_delivery_app/features/cart/data/local_services/hive_constants.dart';
import 'package:food_delivery_app/features/cart/data/local_services/hive_helper.dart';
import 'package:food_delivery_app/food_delivery_app.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  HiveService.init(appDocumentDir.path);
  await Future.wait([
    ScreenUtil.ensureScreenSize(),
    setupGetIt(),
    HiveService.openBox(kCartBox)
  ]);
  runApp(FoodDeliveryApp(appRouter: AppRouter()));
}
