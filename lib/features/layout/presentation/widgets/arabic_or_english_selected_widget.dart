import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/core/app_colors.dart';
import 'package:vocabs_note/features/layout/presentation/cubits/write_word_cubit/write_word_cubit.dart';

class ArabicOrEnglishSelectedWidget extends StatelessWidget {
  const ArabicOrEnglishSelectedWidget({Key? key, required this.isArabicSelected, required this.colorCode, required this.buildIsArabic,}) : super(key: key);
  final bool isArabicSelected;
  final int colorCode;
  final bool buildIsArabic;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:()=>context.read<WriteWordCubit>().updateWordLanguage(buildIsArabic),
      child: Container(
        height:50.0.h,
        width:50.0.w,
        decoration:BoxDecoration(
          shape:BoxShape.circle,
          border:Border.all(color:AppColors.white,width:2.5.w),
          color:isArabicSelected == buildIsArabic? AppColors.white :Color(colorCode),
        ),
        child: Center(
          child:Text(
            buildIsArabic? "ar":"en",
            style:TextStyle(
              fontWeight:FontWeight.bold,
              color:isArabicSelected == buildIsArabic ? Color(colorCode) : AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
