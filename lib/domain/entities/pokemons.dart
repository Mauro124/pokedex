import 'dart:convert';

class Pokemons {
  Pokemons({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  final int? count;
  final dynamic next;
  final dynamic previous;
  final List<PokemonResult>? results;

  Pokemons copyWith({
    int? count,
    dynamic next,
    dynamic previous,
    List<PokemonResult>? results,
  }) =>
      Pokemons(
        count: count,
        next: next,
        previous: previous,
        results: results,
      );

  factory Pokemons.fromJson(String str) => Pokemons.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pokemons.fromMap(Map<String, dynamic> json) => Pokemons(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<PokemonResult>.from(json["results"].map((x) => PokemonResult.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toMap())),
      };
}

class PokemonResult {
  PokemonResult({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  PokemonResult copyWith({
    required String name,
    required String url,
  }) =>
      PokemonResult(
        name: name,
        url: url,
      );

  factory PokemonResult.fromJson(String str) => PokemonResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PokemonResult.fromMap(Map<String, dynamic> json) => PokemonResult(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
