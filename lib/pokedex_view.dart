import 'package:bloc_pokedex/bloc/nav_cubit.dart';
import 'package:bloc_pokedex/bloc/pokemon_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/pokemon_state.dart';

class PokedexView extends StatelessWidget {
  const PokedexView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (state is PokemonLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is PokemonPageLoadSuccess) {
            return GridView.builder(
                itemCount: state.pokemonListings.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => BlocProvider.of<NavCubit>(context)
                        .showPokemonDetails(state.pokemonListings[index].id),
                    child: Card(
                      child: GridTile(
                        child: Column(
                          children: [
                            Image.network(
                                state.pokemonListings[index].imageUrl),
                            Text(state.pokemonListings[index].name)
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else if (state is PokemonPageLoadFailed) {
            return Center(
              child: Text(state.error.toString()),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
