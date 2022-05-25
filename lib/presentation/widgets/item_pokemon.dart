import 'package:art_place_app/domain/entities/pokemon.dart';
import 'package:flutter/material.dart';

class ItemPokemonWidget extends StatefulWidget {
  final Pokemon pokemon;
  const ItemPokemonWidget({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<ItemPokemonWidget> createState() => _ItemPokemonWidgetState();
}

class _ItemPokemonWidgetState extends State<ItemPokemonWidget> {
  bool pokemonCreated = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () => setState(() => pokemonCreated = true));
  }

  @override
  Widget build(BuildContext context) {
    return _buildPokemon(widget.pokemon);
  }

  Widget _buildPokemon(Pokemon pokemon) {
    return Center(
      child: pokemon.imageUrl != null
          ? Image.network(
              pokemon.imageUrl!,
              loadingBuilder: (context, child, loadingProgress) => loadingProgress == null
                  ? _buildPokemonAnimation(child)
                  : const Center(child: CircularProgressIndicator(color: Colors.white)),
              fit: BoxFit.cover,
            )
          : const Text("Cargando"),
    );
  }

  AnimatedContainer _buildPokemonAnimation(Widget child) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutBack,
      transformAlignment: Alignment.center,
      transform: Transform.scale(
        scale: pokemonCreated ? 1 : 0.0000001,
      ).transform,
      child: child,
    );
  }
}
