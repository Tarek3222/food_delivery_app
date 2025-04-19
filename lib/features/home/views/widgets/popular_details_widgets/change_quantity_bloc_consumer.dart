import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/core/widgets/custom_snackbar.dart';
import 'package:food_delivery_app/features/cart/logic/set_quantity_cubit/set_quantity_cubit.dart';
import 'package:food_delivery_app/features/cart/logic/set_quantity_cubit/set_quantity_state.dart';

class ChangeQuantityBlocConsumer extends StatelessWidget {
  const ChangeQuantityBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          text: "${context.read<SetQuantityCubit>().quantity}",
          color: AppColors.mainBlackColor,
        );
      },
    );
  }
}
