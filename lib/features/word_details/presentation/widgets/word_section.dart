import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/features/word_details/presentation/widgets/row_title_of_word_details.dart';
import 'package:vocabs_note/features/word_details/presentation/widgets/word_info_widget.dart';

import '../../../../core/app_strings.dart';

class WordSection extends StatelessWidget
{
  const WordSection({Key? key, required this.colorCode, required this.text, required this.isArabic}) : super(key: key);
  final int colorCode;
  final String text;
  final bool isArabic;
  @override
  Widget build(BuildContext context)
  {
    return Column(
      children: [
        RowTitleOfWordDetailsWidget(
          text: AppStrings.wordTitle,
          colorCode: colorCode,
        ),
        SizedBox(
          height: 8.0.h,
        ),
        WordInfoWidget(
          text: text,
          isArabic:isArabic,
          colorCode: colorCode,
        ),
      ],
    );
  }
}
