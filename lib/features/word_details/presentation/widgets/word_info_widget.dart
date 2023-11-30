import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/core/custom_button.dart';

import '../../../../core/app_colors.dart';

class WordInfoWidget extends StatelessWidget {
  const WordInfoWidget({Key? key, required this.isArabic,this.onPressed, required this.text, required this.colorCode}) : super(key: key);
  final bool isArabic;
  final String text;
  final int colorCode;
  final VoidCallback?onPressed;
  @override
  Widget build(BuildContext context)
  {
    return Container(
      padding:EdgeInsetsDirectional.symmetric(horizontal:12.0.w,vertical:6.0.h),
      decoration:BoxDecoration(
        borderRadius:BorderRadius.circular(20.0.r),
        color:Color(colorCode),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius:20.0.r,
            backgroundColor:AppColors.black,
            child:Text(
              isArabic ? "ar":"en",
              style:TextStyle(
                color:Color(colorCode),
              ),
            ),
          ),
           SizedBox(width:8.0.w,),
          Expanded(
            child: Text(
              text,
              style:TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22.sp,
              ),
            ),
          ),
          if(onPressed!=null)
            CustomButton(
                onPressed: onPressed!,
              color:AppColors.black,
            ),
        ],
      ),
    );
  }
}
