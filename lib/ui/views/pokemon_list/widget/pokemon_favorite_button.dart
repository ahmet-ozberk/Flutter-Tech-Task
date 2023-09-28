import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/api/response/pokemon_list_model.dart';
import '../../../../app/constants/app_constant.dart';
import '../../favorites/provider/favorite_provider.dart';

class PokemonFavoriteButton extends ConsumerStatefulWidget {
  final PokemonListModelResults item;
  const PokemonFavoriteButton({super.key, required this.item});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonFavoriteButtonState();
}

class _PokemonFavoriteButtonState extends ConsumerState<PokemonFavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return ref.watch(hasFavoriteProvider(widget.item)).when(
          data: (data) => DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  AC.favoriteButtonBackgroundColor.withOpacity(0.4),
                  AC.favoriteButtonBackgroundColor.withOpacity(0.0),
                ],
              ),
            ),
            child: IconButton(
              onPressed: () => favoriteButtonClicked(data),
              icon: Icon(favoriteIcon(data), color: Colors.white),
            ),
          ),
          error: (err, stt) => const SizedBox.shrink(),
          loading: () => favoriteButtonLoading(),
        );
  }

  IconData favoriteIcon(data) =>
      data ? Icons.favorite_rounded : Icons.favorite_outline_rounded;

  void favoriteButtonClicked(bool data) {
    final item = widget.item;
    ref
        .read(data ? removeFavoriteProvider(item) : addFavoriteProvider(item))
        .then((value) => ref.invalidate(hasFavoriteProvider));
  }

  IconButton favoriteButtonLoading() {
    return const IconButton(
      onPressed: null,
      icon: Icon(
        Icons.favorite_outline_rounded,
        color: Colors.white,
      ),
    );
  }
}
