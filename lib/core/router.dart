import 'package:breaking_bad/core/services/sercives_locator.dart';
import 'package:breaking_bad/data/models/characters.dart';
import 'package:breaking_bad/data/repository/Characters_repository.dart';
import 'package:breaking_bad/presentation/screens/characters_details_screen.dart';
import 'package:breaking_bad/presentation/screens/characters_screen.dart';
import 'package:breaking_bad/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business_logic/character_details_cubit/character_deatails_cubit.dart';
import '../business_logic/characters_cubit/characters_cubit.dart';
import 'constants/routes.dart';

class AppRouter {
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersCubit = CharactersCubit(sl<CharactersRepository>());
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute :
        return MaterialPageRoute(builder: (_)=>const SplashScreen());
      case charactersScreenRoute:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (context) => charactersCubit,
                child: const CharactersScreen()));
      case charactersDetailsScreenRoute:
        final character = settings.arguments as CharactersModel;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (context)=>CharacterDetailsCubit(),
              child: CharactersDetailsScreen(
                    character: character,
                  ),
            ));
    }
    return null;
  }
}
