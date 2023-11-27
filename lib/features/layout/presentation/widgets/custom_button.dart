import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_strings.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key? key, required this.colorCode, required this.onTap}) : super(key: key);
  final int colorCode;
  final GestureTapCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:AlignmentDirectional.centerEnd,
      child: InkWell(
        onTap:onTap,
        child: Container(
          height:40.0.h,
          width:65.0.w,
          decoration:BoxDecoration(
            color:AppColors.white,
            borderRadius:BorderRadius.circular(12.0.r),
          ),
          child:Center(
            child:Text(
                AppStrings.buttonName,
              style:TextStyle(
                color:Color(colorCode),
                fontWeight:FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
