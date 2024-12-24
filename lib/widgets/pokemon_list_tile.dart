import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poki_dex/models/pokemon.dart';
import 'package:poki_dex/providers/pokemon_data_providers.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PokemonListTile extends ConsumerWidget {
  final String pokemonURL;

  const PokemonListTile({super.key, required this.pokemonURL});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final pokemon = ref.watch(
      pokemonDataProvider(
        pokemonURL,
      ),
    );

    return pokemon.when(
      data: (data) {
        return _tile(
          context,
          false,
          data,
        );
      },
      error: (error, stackTrace) {
        return Text("error: $error");
      },
      loading: () {
        return _tile(
          context,
          true,
          null,
        );
      },
    );
  }

  Widget _tile(
    BuildContext context,
    bool isLoading,
    Pokemon? pokemon,
  ) {
    return Skeletonizer(
      enabled: isLoading,
      child: pokemon == null
          ? const ListTile(
              leading: CircleAvatar(),
              title: Text('current loading for pokemon'),
              subtitle: Text('currently loading moves'),
            )
          : ListTile(
              leading: pokemon.sprites == null
                  ? const Placeholder()
                  : CircleAvatar(
                      backgroundImage:
                          NetworkImage(pokemon.sprites!.frontDefault!),
                    ),
              title: Text(
                pokemon.name!.toUpperCase(),
              ),
              subtitle:
                  Text("Has ${pokemon.moves?.length.toString() ?? 0} moves"),
              trailing: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_border)),
            ),
    );
  }
}
