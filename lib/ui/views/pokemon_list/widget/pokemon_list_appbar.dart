part of pokemon_list_view;

class PokemonListAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const PokemonListAppBar({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(SC.pokemonList),
      centerTitle: false,
      actions: [
        Consumer(builder: (context, ref, child) {
          return Badge(
            label: ref.watch(getFavoriteProvider).when(
                  data: (data) => Text(data?.length.toString() ?? '0'),
                  loading: () => const Text('0'),
                  error: (error, stackTrace) => const Text('0'),
                ),
            child: Icon(
              Icons.favorite_outlined,
              color: Colors.blueGrey.shade100,
              size: 24,
            ),
          ).paddingOnlyRight(16);
        }),
      ],
    );
  }
}
