part of pokemon_list_view;

class PokemonCardWidget extends ConsumerStatefulWidget {
  final PokemonListModelResults item;
  const PokemonCardWidget({super.key, required this.item});

  @override
  ConsumerState<PokemonCardWidget> createState() => _PokemonCardWidgetState();
}

class _PokemonCardWidgetState extends ConsumerState<PokemonCardWidget> {
  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return Stack(
      children: [
        GrockSuperContainer(
          onTap: () => context.pushRoute(PokemonDetailRoute(item: item)),
          isSuperBorderRadius: true,
          superBorderRadius: 50.borderRadius,
          color: Grock.rndColor(),
          child: Center(
              child: Text(
            item.name ?? "",
            style: _titleStyle,
          ).paddingAll(12)),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PokemonFavoriteButton(item: item),
        ),
      ],
    );
  }

  TextStyle get _titleStyle => context.titleMedium.copyWith(
        color: Colors.white,
        shadows: [
          const Shadow(
            color: Colors.black54,
            blurRadius: 10,
          ),
        ],
      );
}
