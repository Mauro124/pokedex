import 'package:art_place_app/domain/entities/pokemon.dart';
import 'package:art_place_app/providers/data_state.dart';
import 'package:art_place_app/providers/pokemon/pokemon_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PokemonNotifier extends StateNotifier<DataState<List<Pokemon>>> {
  Reader read;
  PokemonNotifier({required this.read}) : super(const DataState.initial());

  Future<void> getPokemons() async {
    state = const DataState.loading();
    try {
      List<Pokemon> pokemons = await read(pokemonRepository).getPokemons();
      state = DataState.data(pokemons);
    } catch (ex) {
      state = DataState.error(ex.toString());
    }
  }
}
