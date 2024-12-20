import 'package:poki_dex/models/pokemon.dart';

class HomePageData {
  PokemonListData? data;

  HomePageData({
    required this.data,
  });

  HomePageData.initial() : data = null;

  HomePageData copyWith({PokemonListData? data}) {
    return HomePageData(
      data: data ?? this.data,
    );
  }
}
