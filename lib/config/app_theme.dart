import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/app_colors.dart';

abstract class AppTheme
{
  static ThemeData appTheme()
  {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.black,
      appBarTheme:AppBarTheme(
        color:AppColors.black,
        elevation:0.0,
        centerTitle:true,
        systemOverlayStyle:const SystemUiOverlayStyle(
          statusBarColor:AppColors.black,
          statusBarBrightness:Brightness.light,
        ),
        titleTextStyle:TextStyle(
          color:AppColors.white,
          fontWeight:FontWeight.bold,
          fontSize:18.sp,
        ),
      ),
    );
  }
}