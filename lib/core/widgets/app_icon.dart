import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIcon extends StatelessWidget {
  const AppIcon(
      {super.key,
      this.backgroundColor = const Color(0xFFfcf4e4),
      this.iconColor = const Color(0xFF756d54),
      this.child,
      this.size = 40,
      required this.icon,
      required this.onPressed});
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final Widget? child;
  final void Function() onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: Size(size.w, size.h),
      ),
      icon: child ??
          Icon(
            icon,
            color: iconColor,
            size: 16,
          ),
    );
  }
}
