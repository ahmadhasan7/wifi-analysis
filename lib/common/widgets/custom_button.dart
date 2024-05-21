import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final String? icon;
  final VoidCallback? onTap;

  final double opacity;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final double height, width;
  final Color? borderColor;

  const CustomButton({
    Key? key,
    required this.title,
    this.icon,
    this.opacity = 1,
    required this.onTap,
    this.borderRadius = 8,
    this.textStyle,
    this.buttonColor = AppColors.primaryColor,
    this.borderColor,
    this.width = 330,
    this.height = 55,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: width.w,
          height: height.h,
          decoration: BoxDecoration(
            color: onTap == null
                ? buttonColor!.withOpacity(0.5)
                : buttonColor!.withOpacity(opacity),
            borderRadius: BorderRadius.circular(borderRadius!),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: textStyle ??
                    Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: Colors.white),
              ),
            ],
          ),
        ));
  }
}
