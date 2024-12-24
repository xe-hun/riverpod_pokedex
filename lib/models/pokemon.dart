class PokemonListData {
  int? count;
  String? next;
  String? previous;
  List<PokemonListResult>? results;

  PokemonListData({this.count, this.next, this.previous, this.results});

  PokemonListData.fromJson(Map<String, dynamic> json) {
    count = json["count"];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      results = <PokemonListResult>[];
      json['results'].forEach((v) {
        results!.add(PokemonListResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["count"] = count;
    data["next"] = next;
    data["previous"] = previous;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  PokemonListData copyWith({
    int? count,
    String? next,
    String? previous,
    List<PokemonListResult>? results,
  }) {
    return PokemonListData(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }
}

class PokemonListResult {
  String? name;
  String? url;

  PokemonListResult({this.name, this.url});

  PokemonListResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class Pokemon {
  // List<Abilities>? abilities;
  int? height;
  int? id;
  List<Moves>? moves;
  String? name;
  // Ability? species;
  Sprite? sprites;
  // List<Stats>? stats;
  int? weight;

  Pokemon(
      {
      // this.abilities,
      this.height,
      this.id,
      this.moves,
      this.name,
      // this.species,
      this.sprites,
      // this.stats,
      this.weight});

  Pokemon.fromJson(Map<String, dynamic> json) {
    height = json["height"];
    id = json['id'];
    name = json['name'];
    weight = json['weight'];
    sprites = Sprite.fromJson(json['sprites']);
    if (json['moves'] != null) {
      moves = <Moves>[];
      json['moves'].forEach((v) {
        moves!.add(Moves.fromJson(v));
      });
    }

    // if (json['results'] != null) {
    //   results = <PokemonListResult>[];
    //   json['results'].forEach((v) {
    //     results!.add(PokemonListResult.fromJson(v));
    //   });
    // }
  }
}

class Moves {
  String? name;
  String? url;

  Moves({this.name, this.url});

  Moves.fromJson(Map<String, dynamic> json) {
    name = json["height"];
    url = json['id'];
  }
}

class Sprite {
  String? frontDefault;
  Sprite({this.frontDefault});
  Sprite.fromJson(Map<String, dynamic> json) {
    frontDefault = json["front_default"];
  }
}
