import 'package:art_place_app/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<List<Pokemon>> getPokemons([int offset, int limit]);
}
