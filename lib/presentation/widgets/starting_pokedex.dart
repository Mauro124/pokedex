import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class StartingPokedex extends StatefulWidget {
  const StartingPokedex({Key? key}) : super(key: key);

  @override
  State<StartingPokedex> createState() => _StartingPokedexState();
}

class _StartingPokedexState extends State<StartingPokedex> {
  final _animationDuration = const Duration(seconds: 4);
  late Timer _timer;
  late int _index = 1;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(_animationDuration, (timer) => _changeIndex());
  }

  void _changeIndex() {
    int newIndex = Random().nextInt(20);
    setState(() {
      _index = newIndex;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 120,
            width: 120,
            child:
                Image.network("https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$_index.png"),
          ),
          const CircularProgressIndicator(color: Colors.white),
          const SizedBox(height: 32),
          const Text(
            "Iniciando pokedex",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "PokemonHollow",
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
