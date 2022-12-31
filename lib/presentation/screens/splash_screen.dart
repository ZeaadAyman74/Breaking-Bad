import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:breaking_bad/business_logic/characters_cubit/characters_cubit.dart';
import 'package:breaking_bad/core/constants/colors.dart';
import 'package:breaking_bad/data/repository/Characters_repository.dart';
import 'package:breaking_bad/presentation/screens/characters_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

import '../../core/services/sercives_locator.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: BlocProvider(
          create: (context) => CharactersCubit(sl<CharactersRepository>()),
          child: const CharactersScreen()),
      splash: Image.asset('assets/images/breaking_bad.png'),
      animationDuration: const Duration(milliseconds: 1900),
      duration: 2500,
      backgroundColor: MyColors.myGrey,
      centered: true,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      splashIconSize: 820,

    );
  }
}
