import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/features/layout/presentation/cubits/read_word_cubit/read_word_cubit.dart';
import '../../../../core/app_colors.dart';
import '../../../word_details/presentation/view/word_details_screen.dart';
import '../../data/model/word_model.dart';

class WordsGridItem extends StatelessWidget {
  const WordsGridItem({Key? key, required this.word}) : super(key: key);
  final WordModel word;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WordDetailsScreen(
                      word: word,
                    ),
            ),
        ).then((value)
        {
          Future.delayed(const Duration(milliseconds:300)).then((value)
          {
            context.read<ReadWordCubit>().fetchWords();
          });

        });
      },
      child: Container(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: 15.0.w, vertical: 15.0.h),
        decoration: BoxDecoration(
          color: Color(word.colorCode),
          borderRadius: BorderRadius.circular(15.0.r),
        ),
        child: Text(
          word.text,
          textDirection:
              word.isArabic == true ? TextDirection.rtl : TextDirection.ltr,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22.sp,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
