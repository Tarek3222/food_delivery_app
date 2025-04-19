import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/spaceing.dart';
import 'package:food_delivery_app/core/networking/api_constants.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/core/widgets/small_text.dart';
import 'package:food_delivery_app/features/cart/data/models/cart_model.dart';

class BuildProductsListViewItems extends StatelessWidget {
  const BuildProductsListViewItems({
    super.key,
    required this.products,
  });
  final List<CartModel> products;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Container(
          height: 100.h,
          width: double.infinity,
          margin: const EdgeInsets.only(bottom: 10, left: 16, right: 10).r,
          child: Row(
            children: [
              Container(
                height: 100.h,
                width: 100.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20).w,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "${ApiConstants.baseImageUrl}${products[index].imageUrl}"),
                  ),
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigText(
                      text: products[index].name ?? "",
                    ),
                    const SmallText(
                      text: "spicy",
                      size: 14,
                    ),
                    Row(
                      children: [
                        BigText(
                          text: "\$${products[index].price}",
                          color: Colors.red,
                          size: 18,
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(5).r,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20).w,
                            color: Colors.grey[200],
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.remove,
                                  color: AppColors.signColor,
                                ),
                              ),
                              horizontalSpace(5),
                              BigText(
                                text: "${products[index].quantity}",
                                color: AppColors.mainBlackColor,
                              ),
                              horizontalSpace(5),
                              InkWell(
                                onTap: () {},
                                child: const Icon(
                                  Icons.add,
                                  color: AppColors.signColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
