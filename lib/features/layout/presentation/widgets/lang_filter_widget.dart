import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/core/app_colors.dart';
import 'package:vocabs_note/core/enums.dart';
import 'package:vocabs_note/features/layout/presentation/cubits/read_word_cubit/read_word_cubit.dart';

class LanguageFilterWidget extends StatelessWidget {
  const LanguageFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadWordCubit, ReadWordState>(
        builder: (context, state)
        {
          return Text(
            _mapLangFilterEnumToString(context.read<ReadWordCubit>().languageFilter),
            style:TextStyle(
              color:AppColors.white,
              fontWeight:FontWeight.bold,
              fontSize:25.sp,
            ),
          );
        });
  }

  String _mapLangFilterEnumToString(LanguageFilter languageFilter)
  {
   if(languageFilter == LanguageFilter.allWords)
   {
     return "All Words";
   }else if(languageFilter == LanguageFilter.arabicOnly)
   {
     return "Arabic Words";
   }else
   {
     return "English Words";
   }
  }
}
