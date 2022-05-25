// To parse this JSON data, do
//
//     final pokemon = pokemonFromMap(jsonString);

import 'dart:convert';

class Pokemon {
  Pokemon({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.height,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.name,
    this.order,
    this.pastTypes,
    this.species,
    this.imageUrl,
    this.types,
    this.weight,
  });

  final List<Ability>? abilities;
  final int? baseExperience;
  final List<Species>? forms;
  final int? height;
  final int? id;
  final bool? isDefault;
  final String? locationAreaEncounters;
  final String? name;
  final int? order;
  final List<dynamic>? pastTypes;
  final Species? species;
  final String? imageUrl;
  final List<Type>? types;
  final int? weight;

  Pokemon copyWith({
    List<Ability>? abilities,
    int? baseExperience,
    List<Species>? forms,
    int? height,
    int? id,
    bool? isDefault,
    String? locationAreaEncounters,
    String? name,
    int? order,
    List<dynamic>? pastTypes,
    Species? species,
    String? imageUrl,
    List<Type>? types,
    int? weight,
  }) =>
      Pokemon(
        abilities: abilities ?? this.abilities,
        baseExperience: baseExperience ?? this.baseExperience,
        forms: forms ?? this.forms,
        height: height ?? this.height,
        id: id ?? this.id,
        isDefault: isDefault ?? this.isDefault,
        locationAreaEncounters: locationAreaEncounters ?? this.locationAreaEncounters,
        name: name ?? this.name,
        order: order ?? this.order,
        pastTypes: pastTypes ?? this.pastTypes,
        species: species ?? this.species,
        imageUrl: imageUrl ?? this.imageUrl,
        types: types ?? this.types,
        weight: weight ?? this.weight,
      );

  factory Pokemon.fromJson(String str) => Pokemon.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
        abilities:
            json["abilities"] == null ? null : List<Ability>.from(json["abilities"].map((x) => Ability.fromMap(x))),
        baseExperience: json["base_experience"],
        forms: json["forms"] == null ? null : List<Species>.from(json["forms"].map((x) => Species.fromMap(x))),
        height: json["height"],
        id: json["id"],
        isDefault: json["is_default"],
        locationAreaEncounters: json["location_area_encounters"],
        name: json["name"],
        order: json["order"],
        pastTypes: json["past_types"] == null ? null : List<dynamic>.from(json["past_types"].map((x) => x)),
        species: json["species"] == null ? null : Species.fromMap(json["species"]),
        imageUrl:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${json["id"]}.png",
        types: json["types"] == null ? null : List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toMap() => {
        "abilities": abilities == null ? null : List<dynamic>.from(abilities!.map((x) => x.toMap())),
        "base_experience": baseExperience,
        "forms": forms == null ? null : List<dynamic>.from(forms!.map((x) => x.toMap())),
        "height": height,
        "id": id,
        "is_default": isDefault,
        "location_area_encounters": locationAreaEncounters,
        "name": name,
        "order": order,
        "past_types": pastTypes == null ? null : List<dynamic>.from(pastTypes!.map((x) => x)),
        "species": species == null ? null : species!.toMap(),
        "imageUrl": imageUrl,
        "types": types == null ? null : List<dynamic>.from(types!.map((x) => x.toMap())),
        "weight": weight,
      };
}

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  final Species? ability;
  final bool? isHidden;
  final int? slot;

  Ability copyWith({
    Species? ability,
    bool? isHidden,
    int? slot,
  }) =>
      Ability(
        ability: ability ?? this.ability,
        isHidden: isHidden ?? this.isHidden,
        slot: slot ?? this.slot,
      );

  factory Ability.fromJson(String str) => Ability.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ability.fromMap(Map<String, dynamic> json) => Ability(
        ability: json["ability"] == null ? null : Species.fromMap(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toMap() => {
        "ability": ability == null ? null : ability!.toMap(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  Species({
    this.name,
    this.url,
  });

  final String? name;
  final String? url;

  Species copyWith({
    String? name,
    String? url,
  }) =>
      Species(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  factory Species.fromJson(String str) => Species.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Species.fromMap(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}

class Type {
  Type({
    this.slot,
    this.type,
  });

  final int? slot;
  final Species? type;

  Type copyWith({
    int? slot,
    Species? type,
  }) =>
      Type(
        slot: slot ?? this.slot,
        type: type ?? this.type,
      );

  factory Type.fromJson(String str) => Type.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Type.fromMap(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: json["type"] == null ? null : Species.fromMap(json["type"]),
      );

  Map<String, dynamic> toMap() => {
        "slot": slot,
        "type": type == null ? null : type!.toMap(),
      };
}
