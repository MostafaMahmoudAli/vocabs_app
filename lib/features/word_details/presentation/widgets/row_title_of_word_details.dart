import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors.dart';

class RowTitleOfWordDetailsWidget extends StatelessWidget {
  const RowTitleOfWordDetailsWidget({
    Key? key,
    required this.colorCode,
    this.onPressed,
    required this.text,
  }) : super(key: key);
  final int colorCode;
  final VoidCallback? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: Color(colorCode),
              fontWeight: FontWeight.bold,
              fontSize: 25.0.sp,
            ),
          ),
        ),
        if (onPressed != null)
          Container(
            height:32.0.h,
            width:60.0.w,
            decoration:BoxDecoration(
              color: Color(colorCode),
              borderRadius: BorderRadius.circular(12.0.r),
            ),
            child: IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.add,
                color: AppColors.black,
              ),
            ),
          ),
      ],
    );
  }
}
