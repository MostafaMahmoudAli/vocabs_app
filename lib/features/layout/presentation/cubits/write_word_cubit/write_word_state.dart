
part of "write_word_cubit.dart";


@freezed
 class WriteWordState with _$WriteWordState
{
  const factory WriteWordState.initial()= _Initial;
  const factory WriteWordState.loading()= _Loading;
  const factory WriteWordState.loaded()= _Loaded;
  const factory WriteWordState.error(String error)= _Error;
}