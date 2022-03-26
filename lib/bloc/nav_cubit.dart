import 'package:bloc_pokedex/bloc/pokemon_details_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavCubit extends Cubit<int>{
  final PokemonDetailsCubit pokemonDetailsCubit;

  NavCubit({@required this.pokemonDetailsCubit}) : super(null);

  void showPokemonDetails(int pokemonId){
    pokemonDetailsCubit.getPokemonDetails(pokemonId);
    emit(pokemonId);
  }

  void popToPokedex(){
    emit(null);
    pokemonDetailsCubit.clearPokemonDetails();
  }

}