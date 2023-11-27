import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/core/app_colors.dart';
import '../../../../core/app_strings.dart';
import '../../../../core/custom_text.dart';
import '../../../../core/enums.dart';
import '../cubits/read_word_cubit/read_word_cubit.dart';
import 'filters_fields.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadWordCubit, ReadWordState>(builder: (context, state) {
      return Dialog(
        backgroundColor: AppColors.black,
        child: Padding(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: 12.0.w,
            vertical: 12.0.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomText(
                text: AppStrings.langTitleOfFilterFields,
              ),
              SizedBox(
                height: 5.0.h,
              ),
              FiltersFields(
                textLabels: AppStrings.textLabelsOfLanguageFiltersFields,
                onTaps: [
                  () => context.read<ReadWordCubit>().updateLanguageFilter(
                      languageFilter: LanguageFilter.arabicOnly),
                  () => context.read<ReadWordCubit>().updateLanguageFilter(
                      languageFilter: LanguageFilter.englishOnly),
                  () => context.read<ReadWordCubit>().updateLanguageFilter(
                      languageFilter: LanguageFilter.allWords),
                ],
                conditionsOfActivation: [
                  context.read<ReadWordCubit>().languageFilter ==
                      LanguageFilter.arabicOnly,
                  context.read<ReadWordCubit>().languageFilter ==
                      LanguageFilter.englishOnly,
                  context.read<ReadWordCubit>().languageFilter ==
                      LanguageFilter.allWords,
                ],
              ),
              SizedBox(
                height: 10.0.h,
              ),
              const CustomText(
                text: AppStrings.sortedByTitleOfFilterFields,
              ),
              SizedBox(
                height: 5.0.h,
              ),
              FiltersFields(
                textLabels: AppStrings.textLabelsOfSortedByFiltersFields,
                onTaps: [
                  () => context
                      .read<ReadWordCubit>()
                      .updateSortedBy(sortedBy: SortedBy.time),
                  () => context
                      .read<ReadWordCubit>()
                      .updateSortedBy(sortedBy: SortedBy.wordLength),
                ],
                conditionsOfActivation: [
                  context.read<ReadWordCubit>().sortedBy == SortedBy.time,
                  context.read<ReadWordCubit>().sortedBy == SortedBy.wordLength,
                ],
              ),
              SizedBox(
                height: 10.0.h,
              ),
              const CustomText(
                text: AppStrings.sortingTypeTitleOfFilterFields,
              ),
              SizedBox(
                height: 5.0.h,
              ),
              FiltersFields(
                textLabels: AppStrings.textLabelsOfSortingTypeFiltersFields,
                onTaps: [
                  () => context
                      .read<ReadWordCubit>()
                      .updateSortingType(sortingType: SortingType.ascending),
                  () => context
                      .read<ReadWordCubit>()
                      .updateSortingType(sortingType: SortingType.descending),
                ],
                conditionsOfActivation: [
                  context.read<ReadWordCubit>().sortingType == SortingType.ascending,
                  context.read<ReadWordCubit>().sortingType == SortingType.descending,
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
