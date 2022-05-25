import 'package:art_place_app/data/repositories/pokemon_repository_impl.dart';
import 'package:art_place_app/domain/entities/pokemon.dart';
import 'package:art_place_app/domain/repositories/pokemon_repository.dart';
import 'package:art_place_app/providers/data_state.dart';
import 'package:art_place_app/providers/pokemon/pokemon_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pokemonRepository = Provider<PokemonRepository>((ref) => PokemonRepositoryImpl());

final currentIndexOnHoleProvider = StateProvider<int>((ref) => 0);

final pokemonsProvider =
    StateNotifierProvider<PokemonNotifier, DataState<List<Pokemon>>>((ref) => PokemonNotifier(read: ref.read));
