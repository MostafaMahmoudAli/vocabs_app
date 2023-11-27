import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_strings.dart';
import '../../../layout/data/model/word_model.dart';
import '../../../layout/presentation/cubits/write_word_cubit/write_word_cubit.dart';

class WordDetailsScreen extends StatelessWidget {
  const WordDetailsScreen({Key? key, required this.word}) : super(key: key);
  final WordModel word;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor:Color(word.colorCode),
        title: Text(
          AppStrings.wordDetailsTitle,
          style: TextStyle(
            color: Color(word.colorCode),
            fontWeight: FontWeight.bold,
            fontSize: 25.0.sp,
          ),
        ),
        actions: [
          IconButton(
              onPressed: ()
              {
                context.read<WriteWordCubit>().deleteWord(word.indexAtDataBase);
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.delete_rounded,
              ),
          ),
        ],
      ),
      body:Column(
        children: [

        ],
      ),
    );
  }
}
