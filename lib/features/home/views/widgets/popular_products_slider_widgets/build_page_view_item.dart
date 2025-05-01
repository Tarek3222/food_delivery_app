import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_delivery_app/core/helpers/app_dimensions.dart';
import 'package:food_delivery_app/core/networking/api_constants.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/features/home/data/models/popular_products_model.dart';
import 'package:food_delivery_app/features/home/views/widgets/column_food_info.dart';
import 'package:cached_network_image/cached_network_image.dart';

class BuildPageViewItem extends StatelessWidget {
  const BuildPageViewItem(
      {super.key,
      required this.index,
      required this.currentPageValue,
      required this.popularProduct});
  final int index;
  final double currentPageValue;
  final ProductModel popularProduct;
  @override
  Widget build(BuildContext context) {
    Matrix4 matrix = Matrix4.identity();
    double scaleFactor = 0.8;
    double height = AppDimensions.pageViewContainer(context);
    if (index == currentPageValue.floor()) {
      var currScale = 1 - (currentPageValue - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currentPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (currentPageValue - index + 1) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currentPageValue.floor() - 1) {
      var currScale = 1 - (currentPageValue - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
            height: AppDimensions.pageViewContainer(context),
            margin: const EdgeInsets.only(left: 10, right: 10).r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30).w,
              color: AppColors.mainColor,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: CachedNetworkImageProvider(
                  "${ApiConstants.baseImageUrl}${popularProduct.imageUrl}",
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: AppDimensions.pageViewTextContainer(context),
              margin: const EdgeInsets.only(left: 20, right: 20, bottom: 30).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20).w,
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5.0,
                    offset: Offset(0, 5),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10).r,
                child: ColumnFoodInfo(
                  title: popularProduct.name,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
