part of "read_word_cubit.dart";

@freezed
class ReadWordState with _$ReadWordState
{
  const factory ReadWordState.initial() = _Initial;
  const factory ReadWordState.loading() = _Loading;
  const factory ReadWordState.loaded(List<WordModel> words) = _Loaded;
  const factory ReadWordState.error(String error) = _Error;
}