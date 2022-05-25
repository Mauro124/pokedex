import 'package:art_place_app/core/api.dart';
import 'package:art_place_app/domain/entities/pokemon.dart';
import 'package:art_place_app/domain/entities/pokemons.dart';
import 'package:art_place_app/domain/repositories/pokemon_repository.dart';
import 'package:dio/dio.dart';

class PokemonRepositoryImpl extends PokemonRepository {
  Dio dio = Dio();
  List<Pokemon> pokemons = [];

  Future<Pokemon> getPokemonByName(String name) async {
    try {
      Response response = await dio.get("${API.baseUrl}/pokemon/$name").timeout(const Duration(seconds: 10));
      return Pokemon.fromMap(response.data);
    } catch (ex) {
      print(ex.toString());
      rethrow;
    }
  }

  @override
  Future<List<Pokemon>> getPokemons([int offset = 0, int limit = 60]) async {
    try {
      if (pokemons.isEmpty) {
        Response response =
            await dio.get("${API.baseUrl}/pokemon?limit=$limit&offset=$offset").timeout(const Duration(seconds: 10));
        Pokemons pokemonsResponse = Pokemons.fromMap(response.data);

        for (var element in pokemonsResponse.results!) {
          Pokemon pokemon = await getPokemonByName(element.name);
          pokemons.add(pokemon);
        }
      }

      return pokemons;
    } catch (ex) {
      print(ex.toString());
      rethrow;
    }
  }
}
