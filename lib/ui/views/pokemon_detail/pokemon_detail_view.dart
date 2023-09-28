import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import '../../../app/api/response/pokemon_detail_model.dart';
import '../../../app/api/response/pokemon_list_model.dart';
import '../../../app/constants/string_constant.dart';
import 'provider/pokemon_detail_provider.dart';
import '../pokemon_list/widget/pokemon_favorite_button.dart';
import 'package:grock/grock.dart';

import '../../widgets/app_loading.dart';

@RoutePage()
class PokemonDetailView extends ConsumerStatefulWidget {
  final PokemonListModelResults item;
  const PokemonDetailView({super.key, required this.item});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PokemonDetailViewState();
}

class _PokemonDetailViewState extends ConsumerState<PokemonDetailView> {
  @override
  Widget build(BuildContext context) {
    final id = widget.item.url?.split('pokemon/').last ?? '1';
    final name = widget.item.name ?? '';
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        actions: [
          PokemonFavoriteButton(item: widget.item).paddingOnlyRight(16)
        ],
      ),
      body: ref.watch(pokemonDetailProvider(id)).when(
            data: (data) {
              if (data == null) return _listErrorWidget();
              return SafeArea(
                child: SizedBox.expand(
                  child: SingleChildScrollView(
                    padding: 16.padding,
                    child: Column(
                      children: [
                        _pokemonImage(data),
                        12.height,
                        Row(
                          children: [
                            weightHeightBox(
                              boxName: "Weight",
                              boxValue: data.weight.toString(),
                              icon: Icons.speed_rounded,
                            ).expanded(),
                            12.width,
                            weightHeightBox(
                              boxName: "Height",
                              boxValue: data.height.toString(),
                              icon: Icons.straighten_rounded,
                            ).expanded(),
                          ],
                        ),
                        24.height,
                        effectiveContainer(
                          children: [
                            Text(
                              "Abilities",
                              style: context.titleMedium,
                            ),
                            _abilitiesWrapWidget(data, context),
                          ],
                        ),
                        24.height,
                        effectiveContainer(
                          children: [
                            Text(
                              "Base Stats",
                              style: context.titleMedium,
                            ),
                            12.height,
                            _baseStatsWidget(data, context),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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

  Column _baseStatsWidget(PokemonDetailModel data, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: data.stats
              ?.map(
                  (e) => _baseStatsItemWidget(e, context).paddingOnlyBottom(8))
              .toList() ??
          [],
    );
  }

  Column _baseStatsItemWidget(
      PokemonDetailModelStats? e, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${e?.stat?.name ?? ""} (${e?.baseStat ?? 0})",
          style: context.bodySmall,
        ),
        ClipRRect(
          borderRadius: 4.borderRadius,
          child: LinearProgressIndicator(
            minHeight: 6,
            value: Grock.normalizeValue(e?.baseStat?.toDouble() ?? 0, 0, 200),
            backgroundColor: Colors.grey.shade50,
            valueColor: AlwaysStoppedAnimation<Color>(Grock.rndColor()),
          ),
        ),
      ],
    );
  }

  Wrap _abilitiesWrapWidget(PokemonDetailModel data, BuildContext context) {
    return Wrap(
      runSpacing: 12,
      spacing: 12,
      children: data.abilities
              ?.map((e) => _abilitiesChipWidget(e, context))
              .toList() ??
          [],
    );
  }

  Chip _abilitiesChipWidget(
      PokemonDetailModelAbilities? e, BuildContext context) {
    return Chip(
      label: Text(e?.ability?.name ?? "", style: context.bodySmall),
      shape: RoundedRectangleBorder(
        borderRadius: 20.borderRadius,
      ),
      backgroundColor: Grock.rndColor().withOpacity(0.1),
      padding: 10.paddingHorizontal,
    );
  }

  Widget effectiveContainer({required List<Widget> children}) {
    return Container(
      padding: 12.padding,
      width: double.maxFinite,
      decoration: BoxDecoration(
          color: Grock.rndColor().withOpacity(0.08),
          borderRadius: 20.borderRadius),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget weightHeightBox(
      {required final String boxName,
      required final String boxValue,
      required final IconData icon}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade50,
        borderRadius: 12.borderRadius,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.black87),
              12.width,
              Text(
                boxValue,
                style: context.titleLarge.copyWith(fontWeight: FontWeight.w300),
              ),
            ],
          ).paddingTopHorizontal(12),
          Divider(color: Colors.blueGrey.shade100),
          Text(
            boxName,
            style: context.bodySmall.copyWith(color: Colors.grey.shade700),
          ).paddingBottomHorizontal(12),
        ],
      ),
    );
  }

  Widget _pokemonImage(PokemonDetailModel data) {
    return Column(
      children: [
        SvgPicture.network(data.sprites?.other?.dreamWorld?.frontDefault ?? ''),
        Wrap(
          runSpacing: 12,
          spacing: 12,
          children: data.types
                  ?.map((e) => Chip(
                        label: Text(e?.type?.name ?? ""),
                        shape: RoundedRectangleBorder(
                          borderRadius: 20.borderRadius,
                        ),
                        padding: 10.paddingHorizontal,
                      ))
                  .toList() ??
              [],
        ),
      ],
    )
        .paddingAll(12)
        .decoration(
            color: Grock.rndColor().withOpacity(0.2),
            borderRadius: 20.borderRadius)
        .size(width: double.maxFinite);
  }

  Center _listErrorWidget() => const Center(child: Text(SC.pokemonDetailError));
}
