import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/core/app_colors.dart';
import 'package:vocabs_note/core/app_strings.dart';
import 'package:vocabs_note/features/layout/presentation/cubits/write_word_cubit/write_word_cubit.dart';
import 'package:vocabs_note/features/layout/presentation/widgets/arabic_or_english_selected_widget.dart';
import 'package:vocabs_note/features/layout/presentation/widgets/custom_text_form_field.dart';

import '../../../../core/custom_done_button.dart';

class SimilarWordOrExamplesDialog extends StatefulWidget {
  const SimilarWordOrExamplesDialog(
      {Key? key, required this.isExample,required this.colorCode, required this.indexAtDataBase,})
      : super(key: key);
  final int colorCode;
  final bool isExample;
  final int indexAtDataBase;
  @override
  State<SimilarWordOrExamplesDialog> createState() =>
      _SimilarWordOrExamplesDialogState();
}

class _SimilarWordOrExamplesDialogState
    extends State<SimilarWordOrExamplesDialog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor:Color(widget.colorCode),
      child: BlocConsumer<WriteWordCubit, WriteWordState>(
        listener:(context,state)
        {
        state.maybeWhen(
          orElse:(){},
          loaded:()
          {
            Navigator.pop(context);
          },
          error:(message)
          {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor:AppColors.red,
                  content: Text(
                      message,
                    style:const TextStyle(
                      fontWeight:FontWeight.bold,
                    ),
                  ),
                ),
            );
          }
        );
        },
        builder: (context, state) {
          return Padding(
            padding:  EdgeInsetsDirectional.symmetric(
              horizontal:10.0.w,
              vertical:10.0.h,
            ),
            child: Column(
              mainAxisSize:MainAxisSize.min,
              children: [
                Row(
                  children: [
                    ArabicOrEnglishSelectedWidget(
                      isArabicSelected: context.read<WriteWordCubit>().isArabic,
                      colorCode: widget.colorCode,
                      buildIsArabic: true,
                    ),
                    SizedBox(
                      width: 6.0.w,
                    ),
                    ArabicOrEnglishSelectedWidget(
                      isArabicSelected: context.read<WriteWordCubit>().isArabic,
                      colorCode: widget.colorCode,
                      buildIsArabic: false,
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0.h,
                ),
                CustomTextFormField(
                  formKey: _formKey,
                  labelText: widget.isExample
                      ? AppStrings.newExampleTextFieldTitle
                      : AppStrings.newSimilarWordTextFieldTitle,
                ),
                SizedBox(
                  height: 10.0.h,
                ),
                CustomDoneButton(
                  colorCode:widget.colorCode,
                  onTap:()
                  {
                    if(_formKey.currentState!.validate())
                    {
                      if(widget.isExample==true)
                      {
                        context.read<WriteWordCubit>().addExample(widget.indexAtDataBase);
                      }else
                      {
                        context.read<WriteWordCubit>().addSimilarWord(widget.indexAtDataBase);
                      }
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
