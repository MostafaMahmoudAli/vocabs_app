import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/features/layout/presentation/cubits/read_word_cubit/read_word_cubit.dart';
import 'package:vocabs_note/features/layout/presentation/cubits/write_word_cubit/write_word_cubit.dart';
import 'package:vocabs_note/features/word_details/presentation/widgets/row_title_of_word_details.dart';
import 'package:vocabs_note/features/word_details/presentation/widgets/similar_word_or_examples_dialog.dart';
import 'package:vocabs_note/features/word_details/presentation/widgets/word_info_widget.dart';

import '../../../../core/app_strings.dart';

class ExampleSection extends StatelessWidget {
  const ExampleSection({
    Key? key,
    required this.colorCode,
    required this.indexAtDataBase,
    required this.arabicExamples,
    required this.englishExamples,
  }) : super(key: key);
  final int colorCode;
  final int indexAtDataBase;
  final List<String> arabicExamples;
  final List<String> englishExamples;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RowTitleOfWordDetailsWidget(
          text: AppStrings.exampleTitle,
          colorCode: colorCode,
          onPressed: () => showDialog(
            context: context,
            builder: (context) => SimilarWordOrExamplesDialog(
              colorCode: colorCode,
              isExample: true,
              indexAtDataBase: indexAtDataBase,
            ),
          ),
        ),
        SizedBox(
          height: 12.0.h,
        ),
        for (var i = 0; i < arabicExamples.length; i++)
          WordInfoWidget(
            isArabic: true,
            text: arabicExamples[i],
            colorCode: colorCode,
            onPressed: () => _deleteArabicExamples(
              index: i,
              context: context,
            ),
          ),
        SizedBox(
          height: 8.0.h,
        ),
        for (var i = 0; i < englishExamples.length; i++)
          WordInfoWidget(
            isArabic: false,
            text: englishExamples[i],
            colorCode: colorCode,
            onPressed: () => _deleteEnglishExamples(
              index: i,
              context: context,
            ),
          ),
      ],
    );
  }

  void _deleteArabicExamples({
    required int index,
    required BuildContext context,
  }) {
    context.read<WriteWordCubit>().deleteExample(
          indexAtDataBase,
          index,
          true,
        );
    context.read<ReadWordCubit>().fetchWords();
  }

  void _deleteEnglishExamples({
    required int index,
    required BuildContext context,
  }) {
    context.read<WriteWordCubit>().deleteExample(
          indexAtDataBase,
          index,
          false,
        );
    context.read<ReadWordCubit>().fetchWords();
  }
}
