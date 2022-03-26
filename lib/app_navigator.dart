import 'package:bloc_pokedex/bloc/nav_cubit.dart';
import 'package:bloc_pokedex/pokedex_view.dart';
import 'package:bloc_pokedex/pokemon_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, int>(
      builder: (context, pokemonId) {
        return Navigator(
          pages: [
            MaterialPage(child: PokedexView()),
            if (pokemonId != null)
              MaterialPage(child: PokemonDetailsView())
          ],
          onPopPage: (route, result) {
            BlocProvider.of<NavCubit>(context).popToPokedex();
            return route.didPop(result);
          },
        );
      },
    );
  }
}
