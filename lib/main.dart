import 'package:bloc_pokedex/app_navigator.dart';
import 'package:bloc_pokedex/bloc/nav_cubit.dart';
import 'package:bloc_pokedex/bloc/pokemon_bloc.dart';
import 'package:bloc_pokedex/bloc/pokemon_details_cubit.dart';
import 'package:bloc_pokedex/bloc/pokemon_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final pokemonDetailsCubit = PokemonDetailsCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex',
      theme: Theme.of(context)
          .copyWith(primaryColor: Colors.red, accentColor: Colors.redAccent),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                PokemonBloc()..add(PokemonPageRequest(page: 0)),
          ),
          BlocProvider(
              create: (context) =>
                  NavCubit(pokemonDetailsCubit: pokemonDetailsCubit)),
          BlocProvider(create: (context) => pokemonDetailsCubit,)
        ],
        child: AppNavigator(),
      ),
    );
  }
}
