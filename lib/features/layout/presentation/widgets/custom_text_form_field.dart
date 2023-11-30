import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/core/app_colors.dart';
import 'package:vocabs_note/core/enums.dart';
import 'package:vocabs_note/features/layout/presentation/cubits/write_word_cubit/write_word_cubit.dart';

class CustomTextFormField extends StatelessWidget
{
   CustomTextFormField({Key? key, required this.formKey, required this.labelText}) : super(key: key);
  final GlobalKey<FormState>formKey;
  final String labelText;
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    return Form(
      key:formKey,
        child:TextFormField(
          controller:textEditingController,
          onChanged:(value)=>context.read<WriteWordCubit>().updateText(value),
          validator:(value)=>validation(
              value:value,
              isArabic:context.read<WriteWordCubit>().isArabic,
            ),
          autofocus:true,
          maxLines:2,
          minLines:1,
          style:const TextStyle(color:AppColors.white),
          cursorColor:AppColors.white,
          decoration:InputDecoration(
            label:Text(labelText,style:const TextStyle(color:AppColors.white),),
            enabledBorder:OutlineInputBorder(
              borderRadius:BorderRadius.circular(15.0.r),
              borderSide:BorderSide(
                color:AppColors.white,
                width:2.0.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:BorderRadius.circular(15.0.r),
              borderSide:BorderSide(
                color:AppColors.white,
                width:2.0.w,
              ),
            ),
            errorBorder:OutlineInputBorder(
              borderRadius:BorderRadius.circular(15.0.r),
              borderSide:BorderSide(
                color:AppColors.red,
                width:2.0.w,
              ),
            ),
            focusedErrorBorder:OutlineInputBorder(
              borderRadius:BorderRadius.circular(15.0.r),
              borderSide:BorderSide(
                color:AppColors.red,
                width:2.0.w,
              ),
            ),
          ),
        ),
    );
  }

String?validation({String? value, required bool isArabic})
{
  if(value==null&&value!.trim().isEmpty)
  {
    return "This field has not be empty";
  }

  for(var i=0; i<value.length;i++)
  {
    CharType charType = _getCharacterType(value.codeUnitAt(i));
    if(charType == CharType.notValidCharacter)
    {
      return "Character number${i+1} is not a valid character";
    }else if (charType == CharType.arabic&&isArabic==false)
    {
      return "Character number${i+1} is not an English letter";
    }else if(charType == CharType.english&&isArabic==true)
    {
      return "Character number${i+1} is not an Arabic letter";
    }
  }
}

CharType _getCharacterType(int asciiCode)
{
  if((asciiCode>=65&&asciiCode<=90)||(asciiCode>=97&&asciiCode<=122))
  {
    return CharType.english;
  }else if(asciiCode>=1569&&asciiCode<=1729)
  {
    return CharType.arabic;
  }else if(asciiCode==32)
  {
    return CharType.space;
  }
  return CharType.notValidCharacter;
}


}
