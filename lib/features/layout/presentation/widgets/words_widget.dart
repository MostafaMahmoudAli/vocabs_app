import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/features/layout/presentation/widgets/words_grid_item.dart';
import '../../../../core/app_strings.dart';
import '../cubits/read_word_cubit/read_word_cubit.dart';
import 'exception_widget.dart';

class WordsWidget extends StatelessWidget {
  const WordsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadWordCubit, ReadWordState>(
      builder: (context, state) {
        return state.when(
          initial: () => const CircularProgressIndicator(),
          loading: () => const CircularProgressIndicator(),
          loaded: (words) {
            if (words.isEmpty) {
              return const ExceptionWidget(
                iconData:Icons.list_outlined,
                message: AppStrings.noWordsListTitle,
              );
            }
            return Expanded(
              child: GridView.builder(
                physics:const BouncingScrollPhysics(),
                itemCount:words.length,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  mainAxisSpacing:10.0.h,
                  crossAxisSpacing:10.0.w,
                  childAspectRatio:2/1.5,
                ),
                itemBuilder: (context,index)
                {
                  return WordsGridItem(word:words[index],);
                },
              ),
            );
          },
          error: (message) => ExceptionWidget(message: message, iconData: Icons.error_outline_rounded,),
        );
      },
    );
  }
}
