import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../core/app_strings.dart';
import '../../../../../core/enums.dart';
import '../../../data/model/word_model.dart';

part 'read_word_state.dart';

part 'read_word_cubit.freezed.dart';

class ReadWordCubit extends Cubit<ReadWordState> {
  ReadWordCubit() : super(const ReadWordState.initial());
  final Box _box = Hive.box(AppStrings.wordsBox);
  LanguageFilter languageFilter = LanguageFilter.allWords;
  SortedBy sortedBy = SortedBy.time;
  SortingType sortingType = SortingType.descending;

  void updateLanguageFilter({required LanguageFilter languageFilter})
  {
    this.languageFilter = languageFilter;
    fetchWords();
  }

  void updateSortedBy({required SortedBy sortedBy})
  {
    this.sortedBy = sortedBy;
    fetchWords();
  }

  void updateSortingType({required SortingType sortingType})
  {
    this.sortingType = sortingType;
    fetchWords();
  }

  void fetchWords()
  {
    emit(const ReadWordState.loading());
    try {
      List<WordModel> returnedWords =
          List.from(_box.get(AppStrings.wordsListKey, defaultValue: [])).cast<WordModel>();
      _wordsFilter(returnedWords);
      _applySorting(returnedWords);
      emit(ReadWordState.loaded(returnedWords));
    } catch (error) {
      emit(const ReadWordState.error(
          "we have problems in fetching word , please try again later"));
    }
  }

  void _wordsFilter(List<WordModel> returnedWords)
  {
    if (languageFilter == LanguageFilter.allWords){
      return;
    }
    for (var i = 0; i < returnedWords.length; i++)
    {
      if ((
          languageFilter == LanguageFilter.arabicOnly && returnedWords[i].isArabic == false) ||
          (languageFilter == LanguageFilter.englishOnly && returnedWords[i].isArabic == true))
      {
        returnedWords.removeAt(i);
        i--;
      }
    }
  }

  void _applySorting(List<WordModel> returnedWords)
  {
    if(sortedBy == SortedBy.time)
    {
      if(sortingType == SortingType.ascending)
      {
        return ;
      }else
      {
        _reverse(returnedWords);
      }
    }else
    {
      returnedWords.sort(( WordModel a,  WordModel b) => a.text.length.compareTo(b.text.length),);
      if(sortingType == SortingType.ascending)
      {
        return;
      }else
      {
        _reverse(returnedWords);
      }
    }

  }

  void _reverse(List<WordModel> returnedWords)
  {
    for(var i=0; i<returnedWords.length/2; i++)
    {
      WordModel temp = returnedWords[i];
      returnedWords[i]=returnedWords[returnedWords.length -1 -i];
      returnedWords[returnedWords.length -1 -i] = temp;
    }
  }
}


