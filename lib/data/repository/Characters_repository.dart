import 'package:breaking_bad/data/data_source/characters_data_source.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/data/models/quotes.dart';
import 'package:breaking_bad/data/repository/base_repository.dart';

class CharactersRepository extends BaseCharactersRepository{
  final CharactersDataSource _charactersDataSource;

  CharactersRepository(this._charactersDataSource);

  @override
  Future<List<CharactersModel>> fetchCharacters({Map<String,dynamic>? parameters}) async{
  final characters=  await _charactersDataSource.fetchCharacters(parameters: parameters);
  return characters.map((e) => CharactersModel.fromJson(e)).toList();
  }

  @override
  Future<List<Quotes>> getCharacterQuote(String characterName)async {
    final characterQuotes=await _charactersDataSource.getCharacterQuote(characterName);
   return characterQuotes.map((e) => Quotes.fromJson(e)).toList();
  }

}