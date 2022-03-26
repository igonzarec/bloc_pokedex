import 'dart:convert';

import 'package:bloc_pokedex/data/pokemon_info_response.dart';
import 'package:bloc_pokedex/data/pokemon_page_response.dart';
import 'package:bloc_pokedex/data/pokemon_species_info_response.dart';
import 'package:http/http.dart' as http;

// Our repository is going to have all the functions that represent the
// networking requests for this app
class PokemonRepository {
  final baseUrl = 'pokeapi.co';
  final client = http.Client(); //this is for dependency injection purposes

  Future<PokemonPageResponse> getPokemonPage(int pageIndex) async {
    //pokemon?limit=100&offset=200

    final queryParameters = {
      'limit': '200',
      'offset': (pageIndex * 200).toString()
    };

    final uri = Uri.https(baseUrl, 'api/v2/pokemon', queryParameters);

    final response = await client.get(uri);
    final json = jsonDecode(response.body);

    return PokemonPageResponse.fromJson(json);
  }

  Future<PokemonInfoResponse> getPokemonInfo(int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);
      return PokemonInfoResponse.fromJson(json);
    } catch (e) {
      print(e);
    }
  }

  Future<PokemonSpeciesInfoResponse> getPokemonSpeciesInfo(
      int pokemonId) async {
    final uri = Uri.https(baseUrl, '/api/v2/pokemon-species/$pokemonId');

    try {
      final response = await client.get(uri);
      final json = jsonDecode(response.body);

      return PokemonSpeciesInfoResponse.fromJson(json);
    } catch (e) {
      print(e);
    }
  }
}
