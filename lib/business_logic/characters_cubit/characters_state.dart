part of 'characters_cubit.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class GetCharactersSuccessState extends CharactersState {
  late List<CharactersModel> characters;

  GetCharactersSuccessState(this.characters);
}

class GetCharactersLoading extends CharactersState {}

class GetCharactersError extends CharactersState {}

class SearchingState extends CharactersState {}

class ClearSearchText extends CharactersState {}

class StartSearchingState extends CharactersState {}

class StopSearchingState extends CharactersState {}

