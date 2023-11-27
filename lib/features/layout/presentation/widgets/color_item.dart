import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/features/layout/presentation/cubits/write_word_cubit/write_word_cubit.dart';

import '../../../../core/app_colors.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    Key? key,
    required this.index,
    required this.colorCode,
    required this.activeColorCode,
  }) : super(key: key);
  final int index;
  final List<int> colorCode;
  final int activeColorCode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.read<WriteWordCubit>().updateColorCode(colorCode[index]),
      child: Container(
        height: 40.0.h,
        width: 40.0.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: activeColorCode == colorCode[index]
              ? Border.all(color: AppColors.white, width: 2.0.w)
              : null,
          color: Color(colorCode[index]),
        ),
        child: activeColorCode == colorCode[index]
            ? const Center(
                child: Icon(
                  color: AppColors.white,
                  Icons.done,
                ),
              )
            : null,
      ),
    );
  }
}
