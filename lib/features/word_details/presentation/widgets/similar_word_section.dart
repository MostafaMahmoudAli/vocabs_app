import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/features/word_details/presentation/widgets/row_title_of_word_details.dart';
import 'package:vocabs_note/features/word_details/presentation/widgets/similar_word_or_examples_dialog.dart';
import 'package:vocabs_note/features/word_details/presentation/widgets/word_info_widget.dart';

import '../../../../core/app_strings.dart';
import '../../../layout/presentation/cubits/read_word_cubit/read_word_cubit.dart';
import '../../../layout/presentation/cubits/write_word_cubit/write_word_cubit.dart';

class SimilarWordSection extends StatelessWidget {
  const SimilarWordSection({
    Key? key,
    required this.colorCode,
    required this.indexAtDataBase,
    required this.arabicSimilarWords,
    required this.englishSimilarWords,
  }) : super(key: key);
  final int colorCode;
  final int indexAtDataBase;
  final List<String> arabicSimilarWords;
  final List<String> englishSimilarWords;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowTitleOfWordDetailsWidget(
          text: AppStrings.similarWordTitle,
          colorCode: colorCode,
          onPressed: () => showDialog(
            context: context,
            builder: (context) => SimilarWordOrExamplesDialog(
              colorCode: colorCode,
              isExample: false,
              indexAtDataBase: indexAtDataBase,
            ),
          ),
        ),
        SizedBox(
          height: 12.0.h,
        ),
        for (var i = 0; i < arabicSimilarWords.length; i++)
          WordInfoWidget(
            isArabic: true,
            text: arabicSimilarWords[i],
            colorCode: colorCode,
            onPressed: ()=>_deleteArabicSimilarWord(
              context:context,
              index:i
            ),
          ),
        SizedBox(
          height: 8.0.h,
        ),
        for (var i = 0; i < englishSimilarWords.length; i++)
          WordInfoWidget(
            isArabic: true,
            text: englishSimilarWords[i],
            colorCode: colorCode,
            onPressed: ()=>_deleteEnglishSimilarWord(
                index: i,
                context: context,
            ),
          ),
      ],
    );
  }

  void _deleteArabicSimilarWord({
    required int index,
    required BuildContext context,
  }) {
    context.read<WriteWordCubit>().deleteSimilarWord(
          indexAtDataBase,
          index,
          true,
        );
    context.read<ReadWordCubit>().fetchWords();
  }

  void _deleteEnglishSimilarWord({
    required int index,
    required BuildContext context,
  }) {
    context.read<WriteWordCubit>().deleteSimilarWord(
      indexAtDataBase,
      index,
      false,
    );
    context.read<ReadWordCubit>().fetchWords();
  }
}
