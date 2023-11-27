import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/core/app_colors.dart';

class CustomText extends StatelessWidget
{
  const CustomText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:TextStyle(
        color:AppColors.white,
        fontWeight:FontWeight.bold,
        fontSize:22.0.sp,
      ),
    );
  }
}
