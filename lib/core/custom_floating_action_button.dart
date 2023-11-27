import 'package:flutter/material.dart';
import 'package:vocabs_note/core/app_colors.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context)
  {
    return FloatingActionButton(
      backgroundColor:AppColors.white,
      foregroundColor:AppColors.white,
      onPressed:onPressed,
      child:const Icon(
        Icons.add,
        color:AppColors.black,
      ),
    );
  }
}
