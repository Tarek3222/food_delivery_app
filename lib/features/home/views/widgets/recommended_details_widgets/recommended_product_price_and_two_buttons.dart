import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/app_icon.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/core/widgets/custom_snackbar.dart';
import 'package:food_delivery_app/features/cart/logic/set_quantity_cubit/set_quantity_cubit.dart';
import 'package:food_delivery_app/features/cart/logic/set_quantity_cubit/set_quantity_state.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';

class RecommendedProductPriceAndTwoButtons extends StatelessWidget {
  const RecommendedProductPriceAndTwoButtons({
    super.key,
    required this.recommendedProduct,
  });

  final PopularProduct recommendedProduct;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        AppIcon(
          icon: Icons.remove,
          onPressed: () {
            context.read<SetQuantityCubit>().setQuantity(false);
          },
          iconColor: Colors.white,
          backgroundColor: AppColors.mainColor,
        ),
        buildPriceTextAndChangeQuantityBlocConsumer(),
        AppIcon(
          icon: Icons.add,
          onPressed: () {
            context.read<SetQuantityCubit>().setQuantity(true);
          },
          iconColor: Colors.white,
          backgroundColor: AppColors.mainColor,
        ),
      ],
    );
  }

  Widget buildPriceTextAndChangeQuantityBlocConsumer() {
    return BlocConsumer<SetQuantityCubit, SetQuantityState>(
      buildWhen: (previous, current) => current is SetQuantityChanged,
      listenWhen: (previous, current) =>
          current is SetQuantityMax || current is SetQuantityMin,
      listener: (context, state) {
        if (state is SetQuantityMax) {
          showTopSnackBar(context, "You can't increase more than 20",
              color: Colors.red);
        } else if (state is SetQuantityMin) {
          showTopSnackBar(context, "You can't reduce less than 0",
              color: Colors.red);
        }
      },
      builder: (context, state) {
        return BigText(
            text:
                " \$${recommendedProduct.price} X ${context.read<SetQuantityCubit>().quantity}",
            color: AppColors.mainBlackColor,
            size: 24);
      },
    );
  }
}
