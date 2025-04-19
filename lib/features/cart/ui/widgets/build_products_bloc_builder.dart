import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/features/cart/logic/cart_cubit/cart_cubit.dart';
import 'package:food_delivery_app/features/cart/logic/cart_cubit/cart_state.dart';
import 'package:food_delivery_app/features/cart/ui/widgets/build_products_list_view_items.dart';

class BuildProductsBlocBuilder extends StatefulWidget {
  const BuildProductsBlocBuilder({super.key});

  @override
  State<BuildProductsBlocBuilder> createState() =>
      _BuildProductsBlocBuilderState();
}

class _BuildProductsBlocBuilderState extends State<BuildProductsBlocBuilder> {
  @override
  void initState() {
    context.read<CartCubit>().getProductsFromCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current is GetProductsFromCartLoading ||
          current is GetProductsFromCartSuccess ||
          current is GetProductsFromCartError ||
          current is GetProductsFromCartEmpty,
      builder: (context, state) {
        if (state is GetProductsFromCartLoading) {
          return setupLoading();
        } else if (state is GetProductsFromCartError) {
          return setupErrorState(state);
        } else if (state is GetProductsFromCartEmpty) {
          return setupEmptyCartState();
        } else if (state is GetProductsFromCartSuccess) {
          return setupSuccessState(state);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  Widget setupSuccessState(GetProductsFromCartSuccess state) {
    return BuildProductsListViewItems(
      products: state.cartProducts,
    );
  }

  Widget setupEmptyCartState() {
    return const Center(child: BigText(text: "Cart is empty"));
  }

  Widget setupErrorState(GetProductsFromCartError state) {
    return Center(
      child: BigText(
        text: state.error,
        color: Colors.red,
      ),
    );
  }

  Widget setupLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
