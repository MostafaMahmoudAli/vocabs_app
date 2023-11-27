class WordModel {
  final int indexAtDataBase;
  final String text;
  final bool isArabic;
  final int colorCode;
  final List<String> arabicSimilarWords;
  final List<String> englishSimilarWords;
  final List<String> arabicExamples;
  final List<String> englishExamples;

  const WordModel({
    required this.indexAtDataBase,
    required this.text,
    required this.isArabic,
    required this.colorCode,
    this.arabicSimilarWords = const [],
    this.englishSimilarWords = const [],
    this.arabicExamples = const [],
    this.englishExamples = const [],
  });

  WordModel decrementIndexAtDataBase()
  {
    return WordModel(
      indexAtDataBase: indexAtDataBase -1,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
    );
  }

  WordModel addSimilarWord(
      String similarWord,
      bool isArabicSimilarWord,
      )
  {
    List<String> newSimilarWords =
    _initializeNewSimilarWords(isArabicSimilarWord: isArabicSimilarWord);

    newSimilarWords.add(similarWord);

    return _fetchWordModelAfterCheckSimilarWords(
      newSimilarWords: newSimilarWords,
      isArabicSimilarWord: isArabicSimilarWord,
    );
  }

  WordModel deleteSimilarWord(
      int indexOfSimilarWord,
      bool isArabicSimilarWord,
      )
  {
    List<String> newSimilarWords =
    _initializeNewSimilarWords(isArabicSimilarWord: isArabicSimilarWord);
    newSimilarWords.removeAt(indexOfSimilarWord);
    return _fetchWordModelAfterCheckSimilarWords(
      newSimilarWords: newSimilarWords,
      isArabicSimilarWord: isArabicSimilarWord,
    );
  }

  WordModel addExample(
      String example,
      bool isArabicExample,
      ) {
    List<String> newExamples = _initializeNewExample(
      isArabicExample: isArabicExample,
    );
    newExamples.add(example);
    return _fetchWordModelAfterCheckExamples(
      isArabicExample: isArabicExample,
      newExample: newExamples,
    );
  }

  WordModel deleteExample(
      int indexOfExampleWord,
      bool isArabicExample,
      ) {
    List<String> newExample = _initializeNewExample(
      isArabicExample: isArabicExample,
    );
    newExample.removeAt(indexOfExampleWord);
    return _fetchWordModelAfterCheckExamples(
      isArabicExample: isArabicExample,
      newExample: newExample,
    );
  }

  // Helper Methods for add & Delete SimilarWordMethod

  List<String> _initializeNewSimilarWords({
    required bool isArabicSimilarWord,
  }) {
    if (isArabicSimilarWord)
    {
      return List.from(arabicSimilarWords);
    }
    return List.from(englishSimilarWords);
  }

  WordModel _fetchWordModelAfterCheckSimilarWords({
    List<String>? newSimilarWords,
    bool? isArabicSimilarWord,
  }) {
    return WordModel(
      indexAtDataBase: indexAtDataBase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicExamples: arabicExamples,
      englishExamples: englishExamples,
      arabicSimilarWords:
      isArabicSimilarWord! ? newSimilarWords! : arabicSimilarWords,
      englishSimilarWords:
      !isArabicSimilarWord ? newSimilarWords! : englishSimilarWords,
    );
  }

  // Helper Methods for Add & Delete ExampleMethods

  List<String> _initializeNewExample({required bool isArabicExample})
  {
    if (isArabicExample)
    {
      return List.from(arabicExamples);
    }
    return List.from(englishExamples);
  }

  WordModel _fetchWordModelAfterCheckExamples({
    required List<String> newExample,
    required bool isArabicExample,
  }) {
    return WordModel(
      indexAtDataBase: indexAtDataBase,
      text: text,
      isArabic: isArabic,
      colorCode: colorCode,
      arabicSimilarWords: arabicSimilarWords,
      englishSimilarWords: englishSimilarWords,
      arabicExamples: isArabicExample ? newExample : arabicExamples,
      englishExamples: !isArabicExample ? newExample : englishExamples,
    );
  }
}
