import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/data/models/quotes.dart';

abstract class BaseCharactersRepository {
  Future<List<CharactersModel>>fetchCharacters({Map<String,dynamic>?parameters});
  Future<List<Quotes>>getCharacterQuote(String characterName);
}