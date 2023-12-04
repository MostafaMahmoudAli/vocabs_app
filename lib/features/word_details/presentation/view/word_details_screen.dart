import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vocabs_note/core/app_colors.dart';
import 'package:vocabs_note/features/layout/presentation/cubits/read_word_cubit/read_word_cubit.dart';
import '../../../../core/app_strings.dart';
import '../../../../core/custom_button.dart';
import '../../../layout/data/model/word_model.dart';
import '../../../layout/presentation/cubits/write_word_cubit/write_word_cubit.dart';
import '../widgets/example_section.dart';
import '../widgets/similar_word_section.dart';
import '../widgets/word_section.dart';

class WordDetailsScreen extends StatefulWidget
{
  const WordDetailsScreen({Key? key, required this.word}) : super(key: key);
  final WordModel word;

  @override
  State<WordDetailsScreen> createState() => _WordDetailsScreenState();
}

class _WordDetailsScreenState extends State<WordDetailsScreen> {

  late WordModel _wordModel;
  @override
  void initState()
  {
    super.initState();
    _wordModel=widget.word;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Color(widget.word.colorCode),
        title: Text(
          AppStrings.wordDetailsTitle,
          style: TextStyle(
            color: Color(widget.word.colorCode),
            fontWeight: FontWeight.bold,
            fontSize: 25.0.sp,
          ),
        ),
        actions: [
          CustomButton(
            onPressed: ()
            {
              context.read<WriteWordCubit>().deleteWord(widget.word.indexAtDataBase);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: BlocBuilder<ReadWordCubit, ReadWordState>(
        builder: (context, state) {
         return state.when(
            initial: ()=>const CircularProgressIndicator(),
            loading: ()=>const CircularProgressIndicator(),
            loaded: (words)
            {
              int index = words.indexWhere((element) => element.indexAtDataBase==_wordModel.indexAtDataBase);
              _wordModel=words[index];
              return Padding(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 12.0.w,
                  vertical: 10.0.h,
                ),
                child: ListView(
                  physics:const BouncingScrollPhysics(),
                  children: [
                    WordSection(
                      text:_wordModel.text,
                      colorCode:_wordModel.colorCode,
                      isArabic:_wordModel.isArabic,
                    ),
                    SizedBox(
                      height: 30.0.h,
                    ),
                    SimilarWordSection(
                      colorCode:_wordModel.colorCode,
                      arabicSimilarWords:_wordModel.arabicSimilarWords,
                      englishSimilarWords: _wordModel.englishSimilarWords,
                      indexAtDataBase:_wordModel.indexAtDataBase,
                    ),
                    SizedBox(
                      height: 30.0.h,
                    ),
                    ExampleSection(
                      colorCode:_wordModel.colorCode,
                      arabicExamples:_wordModel.arabicExamples,
                      englishExamples:_wordModel.englishExamples,
                      indexAtDataBase:_wordModel.indexAtDataBase,
                    ),
                  ],
                ),
              );
            },
            error:(message) {
              return ScaffoldMessenger(
                child:SnackBar(
                backgroundColor:AppColors.red,
                content:Text(
                  message,
                ),
              ),
              );
            },
          );
        },
      ),
    );
  }
}
