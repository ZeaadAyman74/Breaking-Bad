import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:breaking_bad/business_logic/character_details_cubit/character_deatails_cubit.dart';
import 'package:breaking_bad/core/constants/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../business_logic/character_details_cubit/character_details_states.dart';

class CharacterInfo extends StatelessWidget {
  final String title;
  final String value;

  const CharacterInfo({Key? key, required this.title, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style:  TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
          TextSpan(
            text: value,
            style:  TextStyle(color: Colors.white, fontSize: 18.sp),
          ),
        ],
      ),
    );
  }
}

class MyDivider extends StatelessWidget {
  final double endIndent;

  const MyDivider({Key? key, required this.endIndent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: MyColors.myYellow,
      thickness: 3.h,
      endIndent: endIndent,
      height: 30.h,
    );
  }
}

class CharacterQuotes extends StatelessWidget {
  const CharacterQuotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CharacterDetailsCubit,CharacterDetailsState>(
      buildWhen: (previous, current) => (current is GetCharactersQuotesSuccessState),
      builder: (context, state) {
        if (kDebugMode) {
          print('Quotesssssssssssssssssssss////////');
        }
        var cubit=CharacterDetailsCubit.get(context);
        if(cubit.characterQuotes.isNotEmpty){
          return AnimatedTextKit(
            repeatForever: true,
            animatedTexts: cubit.characterQuotes.map((e) => FadeAnimatedText(e.quote!,textStyle: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 25.sp,
              color: MyColors.myYellow,
            ),duration: const Duration(seconds: 3))).toList(),
          );
        }else{
          return Container();
        }
      },
    );
  }
}

class AllCharacterInfo extends StatelessWidget {
  final String appearedIn, status, name;
  final List<dynamic> betterCallSaulSeasons;
  final List<String> jobs;
  final List<int> seasons;
     const  AllCharacterInfo(
      {Key? key,
        required this.name,
        required this.appearedIn,
        required this.jobs,
        required this.seasons,
        required this.status,
        required this.betterCallSaulSeasons,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CharacterInfo(title: 'Job : ', value: jobs.join(' / ')),
         MyDivider(endIndent: 200.w),
        CharacterInfo(title: 'Appeared in : ', value: appearedIn),
         MyDivider(endIndent: 250.w),
        CharacterInfo(title: 'Seasons : ', value: seasons.join(' / ')),
         MyDivider(endIndent: 250.w),
        CharacterInfo(title: 'Status : ', value: status),
         MyDivider(endIndent: 200.w),
        betterCallSaulSeasons.isNotEmpty
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CharacterInfo(
                title: 'Better Call Saul Seasons : ',
                value: betterCallSaulSeasons.join(' / ')),
             MyDivider(endIndent: 150.w),
          ],
        )
            : Container(),
        CharacterInfo(title: 'Actor/Actress : ', value: name),
         MyDivider(endIndent: 250.w),
        const SizedBox(height: 40,),
        const Center(child: CharacterQuotes()) ,
      ],
    );
  }
}

