import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/core/app_colors.dart';

import 'filter_dialog.dart';

class FilterDialogButton extends StatelessWidget
{
  const FilterDialogButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return GestureDetector(
      onTap: ()
      {
        showDialog(context: context, builder: (context) => const FilterDialog());
      },
      child: CircleAvatar(
        radius: 17.0.r,
        backgroundColor:AppColors.white,
        child: const Icon(
          Icons.filter_list_outlined,
          color: AppColors.black,
        ),
      ),
    );
  }
}
