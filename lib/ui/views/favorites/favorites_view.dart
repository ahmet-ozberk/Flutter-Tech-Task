import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/constants/string_constant.dart';
import 'provider/favorite_provider.dart';
import 'package:grock/grock.dart';

import '../../widgets/app_loading.dart';
import '../pokemon_list/pokemon_list_view.dart';

@RoutePage()
class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoritesViewState();
}

class _FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(SC.favorites)),
      body: ref.watch(getFavoriteProvider).when(
            data: (data) {
              if (data == null) return _listErrorWidget();
              if (data.isEmpty) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("👁️‍🗨️", style: context.displayLarge),
                    Text(SC.favoriteEmpty, style: context.titleSmall),
                  ],
                ));
              }
              return GridView.builder(
                padding: 12.padding,
                gridDelegate: _gridDelegate(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data.elementAt(index);
                  if (item == null) return const SizedBox.shrink();
                  return PokemonCardWidget(item: item);
                },
              );
            },
            loading: () => AppLoading.view(),
            error: (error, stackTrace) => Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(error.toString()),
              ),
            ),
          ),
    );
  }

  Center _listErrorWidget() =>
      const Center(child: Text(SC.pokemonFavoriteListError));

  SliverGridDelegateWithFixedCrossAxisCount _gridDelegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    );
  }
}
