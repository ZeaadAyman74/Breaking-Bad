import 'package:breaking_bad/core/router.dart';
import 'package:breaking_bad/data/data_source/characters_data_source.dart';
import 'package:get_it/get_it.dart';
import '../../data/repository/Characters_repository.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton<AppRouter>(() => AppRouter());
    sl.registerLazySingleton<CharactersDataSource>(
        () => CharactersDataSource());
    sl.registerLazySingleton<CharactersRepository>(
        () => CharactersRepository(sl()));
  }
}
