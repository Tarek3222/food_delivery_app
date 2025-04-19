import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/routing/app_router.dart';
import 'package:food_delivery_app/core/routing/routes.dart';
import 'package:food_delivery_app/features/cart/logic/cart_cubit/cart_cubit.dart';

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => CartCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food Delivery App',
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: Routes.homeScreen,
        ),
      ),
    );
  }
}
