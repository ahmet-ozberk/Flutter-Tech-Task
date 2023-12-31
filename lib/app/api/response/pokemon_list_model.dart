///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class PokemonListModelResults {
/*
{
  "name": "bulbasaur",
  "url": "https://pokeapi.co/api/v2/pokemon/1/"
} 
*/

  String? name;
  String? url;

  PokemonListModelResults({
    this.name,
    this.url,
  });
  PokemonListModelResults.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
    url = json['url']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}

class PokemonListModel {
/*
{
  "count": 1292,
  "next": "https://pokeapi.co/api/v2/pokemon?offset=20&limit=20",
  "previous": null,
  "results": [
    {
      "name": "bulbasaur",
      "url": "https://pokeapi.co/api/v2/pokemon/1/"
    }
  ]
} 
*/

  int? count;
  String? next;
  String? previous;
  List<PokemonListModelResults?>? results;

  PokemonListModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });
  PokemonListModel.fromJson(Map<String, dynamic> json) {
    count = json['count']?.toInt();
    next = json['next']?.toString();
    previous = json['previous']?.toString();
  if (json['results'] != null) {
  final v = json['results'];
  final arr0 = <PokemonListModelResults>[];
  v.forEach((v) {
  arr0.add(PokemonListModelResults.fromJson(v));
  });
    results = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    if (results != null) {
      final v = results;
      final arr0 = [];
  for (var v in v!) {
  arr0.add(v!.toJson());
  }
      data['results'] = arr0;
    }
    return data;
  }
}
