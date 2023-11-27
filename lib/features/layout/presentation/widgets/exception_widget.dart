import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/app_colors.dart';

class ExceptionWidget extends StatelessWidget {
  const ExceptionWidget(
      {Key? key, required this.message, required this.iconData})
      : super(key: key);
  final String message;
  final IconData iconData;

  @override
  Widget build(BuildContext context)
  {
    return Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children: [
        Icon(
            iconData,
          color:  AppColors.white,
          size:50,
        ),
    Center(
    child: Text(
    message,
      textAlign:TextAlign.center,
      style: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w900,
        fontSize: 25.0.sp,
      ),
    ),
    ),
    ]
    ,
    );
  }
}
