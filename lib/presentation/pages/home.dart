import 'package:art_place_app/domain/entities/pokemon.dart';
import 'package:art_place_app/presentation/shared/background_widget.dart';
import 'package:art_place_app/presentation/widgets/hole_carousel_widget.dart';
import 'package:art_place_app/presentation/widgets/starting_pokedex.dart';
import 'package:art_place_app/providers/data_state.dart';
import 'package:art_place_app/providers/pokemon/pokemon_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref.read(pokemonsProvider.notifier).getPokemons());
  }

  @override
  Widget build(BuildContext context) {
    DataState<List<Pokemon>> dataStatePokemon = ref.watch(pokemonsProvider);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          const BackgroundWidget(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: dataStatePokemon.when(
                initial: (_) => const StartingPokedex(),
                loading: () => const StartingPokedex(),
                data: (pokemons) => _buildBody(pokemons),
                error: (error, _) => const Text("Ocurrio un error"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Column _buildBody(List<Pokemon> pokemons) {
    int currentIndex = ref.watch(currentIndexOnHoleProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: HoleCarouselWidget(pokemons: pokemons),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: Center(
            child: Column(
              children: [
                _buildPokemonName(pokemons[currentIndex].name!),
                const SizedBox(height: 24),
                _buildInformation(pokemons[currentIndex]),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Text _buildPokemonName(String name) {
    return Text(
      name.toUpperCase(),
      style:
          const TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.bold, fontFamily: 'PokemonHollow'),
    );
  }

  Widget _buildInformation(Pokemon pokemon) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary.withAlpha(50),
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            "N° ${pokemon.id.toString()}",
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'IndieFlower-Regular'),
          ),
          Text(
            "Nivel de experiencia inicial: ${pokemon.baseExperience.toString()}",
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'IndieFlower-Regular'),
          ),
          Text(
            "Altura: ${pokemon.height.toString()} cm",
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'IndieFlower-Regular'),
          ),
          Text(
            "Peso: ${pokemon.weight.toString()} kg",
            style: const TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'IndieFlower-Regular'),
          ),
        ],
      ),
    );
  }
}
