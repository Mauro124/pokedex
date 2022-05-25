import 'package:art_place_app/domain/entities/pokemon.dart';
import 'package:art_place_app/presentation/widgets/item_pokemon.dart';
import 'package:art_place_app/providers/pokemon/pokemon_providers.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HoleCarouselWidget extends ConsumerStatefulWidget {
  final List<Pokemon> pokemons;
  const HoleCarouselWidget({Key? key, required this.pokemons}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HoleCarouselWidgetState();
}

class _HoleCarouselWidgetState extends ConsumerState<HoleCarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      width: 300,
      child: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topLeft,
                radius: 1,
                colors: [
                  Theme.of(context).colorScheme.secondary.withAlpha(100),
                  Colors.black.withAlpha(50),
                ],
              ),
              borderRadius: BorderRadius.circular(200),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 15),
                  blurRadius: 0,
                  color: Colors.black.withAlpha(200),
                  inset: true,
                ),
                BoxShadow(
                  offset: const Offset(10, -30),
                  blurRadius: 0,
                  color: Theme.of(context).colorScheme.secondary.withAlpha(100),
                  inset: true,
                ),
                BoxShadow(
                  offset: const Offset(-10, -30),
                  blurRadius: 0,
                  color: Theme.of(context).colorScheme.secondary.withAlpha(100),
                  inset: true,
                ),
                BoxShadow(
                  offset: const Offset(0, -30),
                  blurRadius: 0,
                  color: Theme.of(context).colorScheme.secondary.withAlpha(100),
                  inset: true,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: _buildCarousel(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCarousel() => PageView.builder(
        itemCount: widget.pokemons.length,
        onPageChanged: (index) {
          ref.read(currentIndexOnHoleProvider.notifier).state = index;
        },
        itemBuilder: (context, index) => ItemPokemonWidget(
          pokemon: widget.pokemons[index],
        ),
      );
}
