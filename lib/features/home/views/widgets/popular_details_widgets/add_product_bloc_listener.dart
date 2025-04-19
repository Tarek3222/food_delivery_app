import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/custom_snackbar.dart';
import 'package:food_delivery_app/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:food_delivery_app/features/cart/logic/cart_cubit/cart_state.dart';

class AddProductBlocListener extends StatelessWidget {
  const AddProductBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is AddProductToCartLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(
                color: AppColors.mainColor,
              ),
            ),
          );
        } else if (state is AddProductToCartSuccess) {
          showTopSnackBar(context, "Product added to cart successfully");
          Navigator.of(context).pop(); // Close the loading dialog
        } else if (state is AddProductToCartError) {
          showTopSnackBar(context, state.error, color: Colors.red);
          Navigator.of(context).pop(); // Close the loading dialog
        } else if (state is AddProductToCartExist) {
          showTopSnackBar(context, state.message);
          Navigator.of(context).pop(); // Close the loading dialog
        }
      },
      listenWhen: (previous, current) =>
          current is AddProductToCartLoading ||
          current is AddProductToCartSuccess ||
          current is AddProductToCartError ||
          current is AddProductToCartExist,
      child: const SizedBox(
        width: 0,
      ),
    );
  }
}
