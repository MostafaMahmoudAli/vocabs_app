import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors.dart';

class FiltersFields extends StatelessWidget {
  const FiltersFields({Key? key, required this.textLabels, required this.onTaps, required this.conditionsOfActivation}) : super(key: key);
  final List<String>textLabels;
  final List<VoidCallback>onTaps;
  final List<bool>conditionsOfActivation;
  @override
  Widget build(BuildContext context)
  {
    return Row(
      children:
      [
        for(var i=0;i<textLabels.length;i++)
          GestureDetector(
            onTap:onTaps[i],
            child: Container(
              margin:EdgeInsetsDirectional.only(start:8.0.w),
              padding:EdgeInsetsDirectional.symmetric(horizontal:10.0.w,vertical:10.0.h),
              decoration:BoxDecoration(
                border:Border.all(color:AppColors.white),
                borderRadius:BorderRadiusDirectional.circular(15.0.r),
                color:conditionsOfActivation[i]?AppColors.white:AppColors.black,
              ),
              child:Center(
                child:Text(
                  textLabels[i],
                  style:TextStyle(
                    color:conditionsOfActivation[i]?AppColors.black:AppColors.white,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
