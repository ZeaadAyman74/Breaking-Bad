import 'package:breaking_bad/business_logic/character_details_cubit/character_details_states.dart';
import 'package:breaking_bad/data/repository/Characters_repository.dart';
import 'package:breaking_bad/data/repository/base_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/services/sercives_locator.dart';
import '../../data/models/quotes.dart';

class CharacterDetailsCubit extends Cubit<CharacterDetailsState>{
CharacterDetailsCubit():super(IntialState());
static CharacterDetailsCubit get(BuildContext context)=>BlocProvider.of<CharacterDetailsCubit>(context);

BaseCharactersRepository baseCharactersRepository=sl<CharactersRepository>();

List<Quotes> characterQuotes = [];

Future<void> getCharacterQuotes(String characterName) async {
  baseCharactersRepository.getCharacterQuote(characterName).then((value) {
    characterQuotes = value;
    if (kDebugMode) {
      print(characterQuotes);
    }
    emit(GetCharactersQuotesSuccessState());
  });
}
}