import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:vocabs_note/core/app_strings.dart';
import 'package:vocabs_note/features/layout/data/model/word_model.dart';

part 'write_word_state.dart';

part 'write_word_cubit.freezed.dart';

class WriteWordCubit extends Cubit<WriteWordState>
{
  WriteWordCubit() : super(const WriteWordState.initial());

  final Box _box = Hive.box(AppStrings.wordsBox);

  String text = "";
  bool isArabic = true;
  int colorCode = 0XFFEF6C00;

  updateText(String text) {
    this.text = text;
  }

  updateWordLanguage(bool isArabic) {
    emit(const WriteWordState.loading());
    this.isArabic = isArabic;
    emit(const WriteWordState.initial());
  }

  updateColorCode(int colorCode) {
    emit(const WriteWordState.loading());
    this.colorCode = colorCode;
    emit(const WriteWordState.initial());
  }

  void addSimilarWord(int indexAtDataBase) {
    _tryAndCatchBlock(
      ()
      {
        List<WordModel> words = _getDataBaseWords();
        words[indexAtDataBase] =
            words[indexAtDataBase].addSimilarWord(text, isArabic);
        _box.put(AppStrings.wordsListKey, words);
        emit(const WriteWordState.loaded());
      },
      "We have a problem when we add a similar word , please try again later ",
    );
  }

  void addExample(int indexAtDataBase) {
    _tryAndCatchBlock(
      () {
        List<WordModel> words = _getDataBaseWords();
        words[indexAtDataBase] =
            words[indexAtDataBase].addExample(text, isArabic);
        _box.put(AppStrings.wordsListKey, words);
        emit(const WriteWordState.loaded());
      },
      "We have a problem when we add an example , please try again later ",
    );
  }

  void deleteSimilarWord(
    int indexAtDataBase,
    int indexOfSimilarWord,
    bool isArabicSimilarWord,
  ){
    _tryAndCatchBlock(()
    {
      List<WordModel> words = _getDataBaseWords();
      words[indexAtDataBase]=words[indexAtDataBase].deleteSimilarWord(indexOfSimilarWord, isArabicSimilarWord);
      _box.put(AppStrings.wordsListKey, words);
      emit(const WriteWordState.loaded());
    },
      "We have a problem when we delete a similar word , please try again later ",
    );
  }

  void deleteExample(
      int indexAtDataBase,
      int indexOfExampleWord,
      bool isArabicExample,
      )
  {
    _tryAndCatchBlock(()
    {
      List<WordModel> words = _getDataBaseWords();
      words[indexAtDataBase]=words[indexAtDataBase].deleteExample(indexOfExampleWord, isArabicExample);
      _box.put(AppStrings.wordsListKey, words);
      emit(const WriteWordState.loaded());
    },
      "We have a problem when we delete an example , please try again later ",
    );
  }

  void addWord() {
    _tryAndCatchBlock(
      () {
        List<WordModel> words = _getDataBaseWords();
        words.add(WordModel(
          indexAtDataBase: words.length,
          text: text,
          isArabic: isArabic,
          colorCode: colorCode,
        ));
        _box.put(AppStrings.wordsListKey, words);
        emit(const WriteWordState.loaded());
      },
      "We have a problem when we add  word , please try agian later ",
    );
  }

  void deleteWord(int indexAtDataBase) {
    _tryAndCatchBlock(
      () {
        List<WordModel> words = _getDataBaseWords();
        words.removeAt(indexAtDataBase);
        for (var i = indexAtDataBase; i < words.length; i++) {
          words[i] = words[i].decrementIndexAtDataBase();
        }
        _box.put(AppStrings.wordsListKey, words);
        emit(const WriteWordState.loaded());
      },
      "We have a problem when we delete  word , please try again later ",
    );
  }

  // Helper Methods

  void _tryAndCatchBlock(VoidCallback methodToExecute, String message)
  {
    emit(const WriteWordState.loading());
    try {
      methodToExecute.call();
    } catch (error)
    {
      emit(WriteWordState.error(message));
    }
  }

  List<WordModel> _getDataBaseWords() =>
      List.from(_box.get(AppStrings.wordsListKey, defaultValue: []))
          .cast<WordModel>();
}
