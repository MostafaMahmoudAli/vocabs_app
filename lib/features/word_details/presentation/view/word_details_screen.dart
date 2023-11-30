import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_strings.dart';
import '../../../../core/custom_button.dart';
import '../../../layout/data/model/word_model.dart';
import '../../../layout/presentation/cubits/write_word_cubit/write_word_cubit.dart';
import '../widgets/row_title_of_word_details.dart';
import '../widgets/show_similar_word_widget.dart';
import '../widgets/similar_word_or_examples_dialog.dart';
import '../widgets/word_info_widget.dart';

class WordDetailsScreen extends StatelessWidget {
  const WordDetailsScreen({Key? key, required this.word}) : super(key: key);
  final WordModel word;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(word.colorCode),
        title: Text(
          AppStrings.wordDetailsTitle,
          style: TextStyle(
            color: Color(word.colorCode),
            fontWeight: FontWeight.bold,
            fontSize: 25.0.sp,
          ),
        ),
        actions: [
          CustomButton(
            onPressed: () {
              context.read<WriteWordCubit>().deleteWord(word.indexAtDataBase);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          horizontal: 12.0.w,
          vertical: 10.0.h,
        ),
        child: ListView(
          physics:const BouncingScrollPhysics(),
          children: [
            RowTitleOfWordDetailsWidget(
              text: AppStrings.wordTitle,
              colorCode: word.colorCode,
            ),
            SizedBox(
              height: 8.0.h,
            ),
            WordInfoWidget(
              text: word.text,
              isArabic: word.isArabic,
              colorCode: word.colorCode,
            ),
            SizedBox(
              height: 30.0.h,
            ),
            RowTitleOfWordDetailsWidget(
              text: AppStrings.similarWordTitle,
              colorCode: word.colorCode,
              onPressed: () => showDialog(
                context: context,
                builder: (context) => SimilarWordOrExamplesDialog(
                  colorCode: word.colorCode,
                  isExample: false,
                  indexAtDataBase:word.indexAtDataBase,
                ),
              ),
            ),
            SizedBox(height:12.0.h,),
            ShowSimilarWordWidget(
              similarWord: word.arabicSimilarWords,
              colorCode:word.colorCode,
              isArabic:true,
              onPressed:(){},
            ),
            SizedBox(height:8.0.h,),
            ShowSimilarWordWidget(
              colorCode:word.colorCode,
              isArabic:false,
              similarWord:word.englishSimilarWords,
              onPressed:(){},
            ),
            SizedBox(
              height: 30.0.h,
            ),
            RowTitleOfWordDetailsWidget(
              text: AppStrings.exampleTitle,
              colorCode: word.colorCode,
              onPressed: () => showDialog(
                context: context,
                builder: (context) => SimilarWordOrExamplesDialog(
                  colorCode:word.colorCode,
                  isExample:true,
                  indexAtDataBase:word.indexAtDataBase,
                ),
              ),
            ),
            SizedBox(height:12.0.h,),
            ShowSimilarWordWidget(
              similarWord: word.arabicExamples,
              colorCode:word.colorCode,
              isArabic:true,
              onPressed:(){},
            ),
            SizedBox(height:8.0.h,),
            ShowSimilarWordWidget(
              colorCode:word.colorCode,
              isArabic:false,
              similarWord:word.englishExamples,
              onPressed:(){},
            ),
          ],
        ),
      ),
    );
  }
}
