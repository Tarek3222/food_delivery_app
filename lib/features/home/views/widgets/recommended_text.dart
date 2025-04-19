import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/spaceing.dart';
import 'package:food_delivery_app/core/widgets/big_text.dart';
import 'package:food_delivery_app/core/widgets/small_text.dart';

class RecommendedText extends StatelessWidget {
  const RecommendedText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30).r,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const BigText(text: "Recommended"),
          horizontalSpace(10),
          Padding(
            padding: const EdgeInsets.only(bottom: 3).r,
            child: const BigText(text: ".", color: Colors.black26),
          ),
          horizontalSpace(10),
          Padding(
            padding: const EdgeInsets.only(bottom: 2).r,
            child: const SmallText(text: "Food Pairing"),
          ),
        ],
      ),
    );
  }
}
