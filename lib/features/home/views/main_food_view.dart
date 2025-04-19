import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/home/views/widgets/food_view_body.dart';
import 'package:food_delivery_app/features/home/views/widgets/main_food_top_bar.dart';

class MainFoodView extends StatelessWidget {
  const MainFoodView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: const SafeArea(
        child: Column(
          children: [
            MainFoodTopBar(),
            Expanded(
              child: SingleChildScrollView(
                child: FoodViewBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
