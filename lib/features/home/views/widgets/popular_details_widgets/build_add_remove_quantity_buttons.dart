import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/spaceing.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/features/cart/logic/set_quantity_cubit/set_quantity_cubit.dart';
import 'package:food_delivery_app/features/home/views/widgets/popular_details_widgets/change_quantity_bloc_consumer.dart';

class BuildAddRemoveQuantityButtons extends StatelessWidget {
  const BuildAddRemoveQuantityButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10).r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20).w,
        color: Colors.white,
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              context.read<SetQuantityCubit>().setQuantity(false);
            },
            child: const Icon(
              Icons.remove,
              color: AppColors.signColor,
            ),
          ),
          horizontalSpace(5),
          const ChangeQuantityBlocConsumer(),
          horizontalSpace(5),
          InkWell(
            onTap: () {
              context.read<SetQuantityCubit>().setQuantity(true);
            },
            child: const Icon(
              Icons.add,
              color: AppColors.signColor,
            ),
          ),
        ],
      ),
    );
  }
}
