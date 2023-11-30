import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/core/app_strings.dart';
import 'package:vocabs_note/features/layout/presentation/cubits/read_word_cubit/read_word_cubit.dart';
import 'package:vocabs_note/features/layout/presentation/cubits/write_word_cubit/write_word_cubit.dart';
import 'arabic_or_english_selected_widget.dart';
import '../../../../core/custom_done_button.dart';
import 'custom_text_form_field.dart';
import 'dialog_background_color.dart';

class AddWordDialog extends StatelessWidget
{
  AddWordDialog({Key? key,}) : super(key: key);
  final GlobalKey<FormState>formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: BlocBuilder<WriteWordCubit, WriteWordState>(
          builder: (context, state) {
            return AnimatedContainer(
              duration:const Duration(milliseconds:800),
              padding:EdgeInsetsDirectional.symmetric(
                vertical:10.0.h,
                horizontal: 10.0.w,
              ),
              color: Color(context.read<WriteWordCubit>().colorCode,),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize:MainAxisSize.min,
                  children:
                  [
                    Row(
                      children: [
                        ArabicOrEnglishSelectedWidget(
                          colorCode: context.read<WriteWordCubit>().colorCode,
                          isArabicSelected:context.read<WriteWordCubit>().isArabic,
                          buildIsArabic:true,
                        ),
                        SizedBox(width:6.0.w,),
                        ArabicOrEnglishSelectedWidget(
                          colorCode: context.read<WriteWordCubit>().colorCode,
                          isArabicSelected:context.read<WriteWordCubit>().isArabic,
                          buildIsArabic:false,
                        ),
                      ],
                    ),
                    SizedBox(height:10.0.h,),
                    DialogBackGroundColors(
                      activeColorCode:context.read<WriteWordCubit>().colorCode,
                    ),
                    SizedBox(height:16.0.h,),
                    CustomTextFormField(
                      labelText:AppStrings.wordTextFormFieldLabel,
                      formKey:formKey,
                    ),
                    SizedBox(height:10.0.h,),
                    CustomDoneButton(
                      colorCode: context.read<WriteWordCubit>().colorCode,
                      onTap:()
                      {
                        if(formKey.currentState!.validate())
                        {
                          context.read<WriteWordCubit>().addWord();
                          context.read<ReadWordCubit>().fetchWords();
                          Navigator.pop(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          }
    ),);
  }


}
