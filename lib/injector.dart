import 'package:get_it/get_it.dart';
import 'features/layout/data/repos/word_repository_impl.dart';
import 'features/layout/domain/repos/word_repository.dart';

final GetIt getIt = GetIt.instance;

void injectorSetUp()async
{
  getIt.registerLazySingleton<WordRepository>(
          ()=>WordRepositoryImpl(),
  );

  //external

}