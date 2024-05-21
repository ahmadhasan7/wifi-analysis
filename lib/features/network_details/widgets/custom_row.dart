import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRow extends StatelessWidget {
  final String title;
  final String value;

  const CustomRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title + ":",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                value,
                softWrap: true,
                overflow: TextOverflow.clip,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!),
            ],
          ),
        ],
      ),
    );
  }
}
