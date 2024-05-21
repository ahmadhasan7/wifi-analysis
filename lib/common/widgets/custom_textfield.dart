import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final double? width;

  final String? Function(String?)? validator;
  final String hintText;

  final TextInputType? keyboardType;

  final Widget? icon;
  final void Function(String)? onChanged;
  final Widget? suffix;

  const CustomTextField(
      {Key? key,
      required this.controller,
      this.width,
      this.validator,
      this.icon,
      required this.hintText,
      this.keyboardType,
      this.onChanged,
      this.suffix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height,
      width: width ?? 335.w,
      decoration: BoxDecoration(
          color: AppColors.whiteColor!,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color.fromRGBO(173, 173, 173, 1))),
      child: TextFormField(
        onChanged: onChanged,
        keyboardType: keyboardType ?? TextInputType.name,
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          suffixIcon: suffix,
          contentPadding: REdgeInsets.only(left: 10.w, top: 5.h),
          prefixIcon: icon,
          alignLabelWithHint: false,
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Color.fromRGBO(137, 137, 137, 1)),
        ),
      ),
    );
  }
}
