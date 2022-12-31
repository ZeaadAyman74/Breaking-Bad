import 'package:breaking_bad/core/constants/colors.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/presentation/widgets/character_info.dart';
import 'package:breaking_bad/presentation/widgets/sliver_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic/character_details_cubit/character_deatails_cubit.dart';

class CharactersDetailsScreen extends StatefulWidget {
  CharactersModel character;

  CharactersDetailsScreen({Key? key, required this.character})
      : super(key: key);

  @override
  State<CharactersDetailsScreen> createState() => _CharactersDetailsScreenState();
}

class _CharactersDetailsScreenState extends State<CharactersDetailsScreen> {
  void _fetchCharacterQuotes()async{
  await  CharacterDetailsCubit.get(context).getCharacterQuotes(widget.character.name!);
  }

  @override
  void initState() {
    _fetchCharacterQuotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myGrey,
      body: CustomScrollView(
        slivers: [
          MySliverAppBar(
            nickName: widget.character.nickname!,
            image: widget.character.img!,
            charId: widget.character.charId!,),
          SliverList(
              delegate: SliverChildListDelegate(
            [
              Container(
                margin: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
                padding: const EdgeInsets.all(8),
                child: AllCharacterInfo(
                    name:widget.character.name!,
                    appearedIn:widget.character.category!,
                    jobs:widget.character.jobs!,
                    betterCallSaulSeasons:widget.character.betterCallSaulAppearance!,
                    seasons: widget.character.appearance!,
                    status:widget.character.status!,
                ),
              ),
               SizedBox(height: 400.h,),
            ],
          ))
        ],
      ),
    );
  }
}
