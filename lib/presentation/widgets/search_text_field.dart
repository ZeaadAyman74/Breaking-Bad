import 'package:flutter/material.dart';
import '../../business_logic/characters_cubit/characters_cubit.dart';
import '../../core/constants/colors.dart';

class SearchTextField extends StatelessWidget {
   const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=CharactersCubit.get(context);
    return TextFormField(
      controller: cubit.searchController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: "Find a Character",
        border: InputBorder.none,
        hintStyle: TextStyle(fontSize: 18, color: MyColors.myGrey),
      ),
      cursorColor: MyColors.myGrey,
      style: const TextStyle(fontSize: 18, color: MyColors.myGrey),
      onChanged: (characterName) {
        cubit.onSearching(characterName);
      },
    );
  }
}
