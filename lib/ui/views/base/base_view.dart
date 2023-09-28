import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../app/route/app_router.gr.dart';

import '../../widgets/app_navigation_bar.dart';

@RoutePage()
class BaseView extends ConsumerStatefulWidget {
  const BaseView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BaseViewState();
}

class _BaseViewState extends ConsumerState<BaseView> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        PokemonListRoute(),
        FavoritesRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => AppNavigationBar(tabsRouter: tabsRouter),
    );
  }
}
