import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallText extends StatelessWidget {
  const SmallText({
    super.key,
    this.color = const Color(0xFFccc7c5),
    required this.text,
    this.size = 12,
    this.height = 1.2,
  });
  final Color color;
  final String text;
  final double size;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size.sp,
        height: height,
        fontFamily: 'Roboto',
      ),
    );
  }
}
