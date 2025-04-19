import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/helpers/app_dimensions.dart';
import 'package:food_delivery_app/core/theme/app_colors.dart';
import 'package:food_delivery_app/core/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({super.key, required this.text});
  final String text;
  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  String firstHalf = "";
  String secondHalf = "";
  bool hiddenText = true;
  late double textHeight;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final textHeight = AppDimensions.screenHeight(context) / 5.63;

      if (widget.text.length > textHeight) {
        setState(() {
          firstHalf = widget.text.substring(0, textHeight.toInt());
          secondHalf =
              widget.text.substring(textHeight.toInt() + 1, widget.text.length);
        });
      } else {
        setState(() {
          firstHalf = widget.text;
          secondHalf = "";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return secondHalf.isEmpty
        ? SmallText(text: firstHalf, size: 16, color: AppColors.paraColor)
        : Column(
            children: [
              SmallText(
                text: hiddenText ? "$firstHalf..." : "$firstHalf$secondHalf",
                size: 16,
                color: AppColors.paraColor,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    hiddenText = !hiddenText;
                  });
                },
                child: Row(
                  children: [
                    SmallText(
                      text: hiddenText ? "Show more" : "Show less",
                      color: AppColors.mainColor,
                    ),
                    Icon(
                        hiddenText
                            ? Icons.arrow_drop_down
                            : Icons.arrow_drop_up,
                        color: AppColors.mainColor),
                  ],
                ),
              ),
            ],
          );
  }
}
