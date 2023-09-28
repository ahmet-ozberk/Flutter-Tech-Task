library pokemon_list_view;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_tech_task/app/api/response/pokemon_list_model.dart';
import 'package:flutter_tech_task/app/constants/string_constant.dart';
import 'package:flutter_tech_task/app/route/app_router.gr.dart';
import 'package:flutter_tech_task/ui/views/pokemon_list/provider/pokemon_list_provider.dart';
import 'package:flutter_tech_task/ui/views/pokemon_list/widget/pokemon_favorite_button.dart';
import 'package:flutter_tech_task/ui/widgets/app_loading.dart';
import 'package:grock/grock.dart';

import '../favorites/provider/favorite_provider.dart';

part 'widget/pokemon_card_widget.dart';
part 'widget/pokemon_list_appbar.dart';

@RoutePage()
class PokemonListView extends ConsumerStatefulWidget {
  const PokemonListView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonListViewState();
}

class _PokemonListViewState extends ConsumerState<PokemonListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PokemonListAppBar(),
      body: ref.watch(pokemonListProvider).when(
            data: (data) {
              if (data == null) return _listErrorWidget();
              if (data.results.isEmpty) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("👁️‍🗨️", style: context.displayLarge),
                    Text(SC.pokemonEmpty, style: context.titleSmall),
                  ],
                ));
              }
              return GridView.builder(
                padding: 12.padding,
                gridDelegate: _gridDelegate(),
                itemCount: data.results?.length ?? 0,
                itemBuilder: (context, index) {
                  final item = data.results?.elementAt(index);
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

  Center _listErrorWidget() => const Center(child: Text(SC.pokemonListError));

  SliverGridDelegateWithFixedCrossAxisCount _gridDelegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
    );
  }
}
