import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigText extends StatelessWidget {
  const BigText({
    super.key,
    this.color = const Color(0xFF332d2b),
    this.fontWeight = FontWeight.w500,
    required this.text,
    this.size = 20,
    this.overflow = TextOverflow.ellipsis,
  });
  final Color color;
  final String text;
  final double size;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size.sp,
        fontWeight: fontWeight,
        fontFamily: 'Roboto',
      ),
    );
  }
}
