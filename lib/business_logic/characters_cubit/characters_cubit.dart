import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/data/repository/base_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.baseCharactersRepository) : super(CharactersInitial());
  late BaseCharactersRepository baseCharactersRepository;

  static CharactersCubit get(BuildContext context) => BlocProvider.of(context);


  static const _pageSize = 10;
  final PagingController<int, CharactersModel> pagingController = PagingController(firstPageKey: 0);
  Future<void> fetchPage(int pageKey) async {
   try{
     final newItems = await baseCharactersRepository
         .fetchCharacters(parameters: {'limit': _pageSize, 'offset': pageKey});
     final isLastPage = newItems.length < _pageSize;
     if (isLastPage) {
       pagingController.appendLastPage(newItems);
     } else {
       final nextPageKey = pageKey + newItems.length;
       pagingController.appendPage(newItems, nextPageKey);
     }
   }catch(error){
     pagingController.error=error;
   }
  }

  // List<CharactersModel> characters = [];
  // Future<List<CharactersModel>> getAllCharacters() async {
  //   baseCharactersRepository.fetchCharacters().then((value) {
  //     characters = value;
  //     emit(GetCharactersSuccessState(value));
  //     if (kDebugMode) {
  //       print(characters);
  //     }
  //   });
  //   return characters;
  // }

  final searchController = TextEditingController();
  bool isSearching = false;
  List<CharactersModel> searchedCharacters = [];

  void onSearching(String characterName) {
    searchedCharacters = pagingController.itemList!
        .where((character) =>
            character.name!.toLowerCase().startsWith(characterName))
        .toList();
    emit(SearchingState());
  }

  void clearSearchText() {
    searchController.clear();
    emit(ClearSearchText());
  }

  void startSearching() {
    isSearching = true;
    emit(StartSearchingState());
  }

  void stopSearching() {
    isSearching = false;
    emit(StopSearchingState());
  }

}
