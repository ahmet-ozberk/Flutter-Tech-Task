import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

import 'app_router.gr.dart';

final routerProvider = Provider((ref) => AppRouter());

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends $AppRouter {
  @override
  GlobalKey<NavigatorState> get navigatorKey => Grock.navigationKey;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: BaseRoute.page, children: [
          AutoRoute(page: PokemonListRoute.page,initial: true),
          AutoRoute(page: FavoritesRoute.page),
        ]),
        AutoRoute(page: PokemonDetailRoute.page),
      ];
}
