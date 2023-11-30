import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/features/word_details/presentation/widgets/word_info_widget.dart';

class ShowSimilarWordWidget extends StatelessWidget {
  const ShowSimilarWordWidget({Key? key, required this.similarWord,required this.isArabic, required this.colorCode, required this.onPressed})
      : super(key: key);
  final List<String>similarWord;
  final bool isArabic;
  final int colorCode;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < similarWord.length; i++)
          Column(
            children: [
              WordInfoWidget(
                isArabic: isArabic,
                text: similarWord[i],
                colorCode: colorCode,
                onPressed:onPressed,
              ),
              SizedBox(height:6.0.h,),
            ],
          ),
      ],
    );
  }
}
