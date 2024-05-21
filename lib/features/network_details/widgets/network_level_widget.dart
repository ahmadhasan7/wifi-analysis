import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/enums/network_level.dart';

class NetworkLevelWidget extends StatelessWidget {
  const NetworkLevelWidget({
    super.key,
    required this.level,
  });

  final NetworkLevel level;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Network Level" + ":  ",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text(
            getLevelString(level!),
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: level == NetworkLevel.Excellent ||
                        level == NetworkLevel.VeryGood
                    ? Colors.green
                    : level == NetworkLevel.Okay
                        ? Colors.orange
                        : Colors.red),
          ),
        ],
      ),
    );
  }
}
