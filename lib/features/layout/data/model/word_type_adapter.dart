import 'package:hive/hive.dart';
import 'package:vocabs_note/features/layout/data/model/word_model.dart';

class WordTypeAdapter implements TypeAdapter<WordModel> {
  @override
  WordModel read(BinaryReader reader)
  {
    return WordModel(
      indexAtDataBase: reader.readInt(),
      text: reader.readString(),
      isArabic: reader.readBool(),
      colorCode: reader.readInt(),
      arabicSimilarWords: reader.readStringList(),
      englishSimilarWords: reader.readStringList(),
      arabicExamples: reader.readStringList(),
      englishExamples: reader.readStringList(),
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, WordModel obj)
  {
    writer.writeInt(obj.indexAtDataBase);
    writer.writeString(obj.text);
    writer.writeBool(obj.isArabic);
    writer.writeInt(obj.colorCode);
    writer.writeStringList(obj.arabicSimilarWords);
    writer.writeStringList(obj.englishSimilarWords);
    writer.writeStringList(obj.arabicExamples);
    writer.writeStringList(obj.englishExamples);
  }
}
