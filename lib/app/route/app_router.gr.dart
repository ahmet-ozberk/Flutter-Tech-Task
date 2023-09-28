// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter_tech_task/app/api/response/pokemon_list_model.dart'
    as _i8;
import 'package:flutter_tech_task/ui/views/base/base_view.dart' as _i1;
import 'package:flutter_tech_task/ui/views/favorites/favorites_view.dart'
    as _i2;
import 'package:flutter_tech_task/ui/views/pokemon_detail/pokemon_detail_view.dart'
    as _i3;
import 'package:flutter_tech_task/ui/views/pokemon_list/pokemon_list_view.dart'
    as _i4;
import 'package:flutter_tech_task/ui/views/splash/splash_view.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    BaseRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BaseView(),
      );
    },
    FavoritesRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.FavoritesView(),
      );
    },
    PokemonDetailRoute.name: (routeData) {
      final args = routeData.argsAs<PokemonDetailRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.PokemonDetailView(
          key: args.key,
          item: args.item,
        ),
      );
    },
    PokemonListRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PokemonListView(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.BaseView]
class BaseRoute extends _i6.PageRouteInfo<void> {
  const BaseRoute({List<_i6.PageRouteInfo>? children})
      : super(
          BaseRoute.name,
          initialChildren: children,
        );

  static const String name = 'BaseRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.FavoritesView]
class FavoritesRoute extends _i6.PageRouteInfo<void> {
  const FavoritesRoute({List<_i6.PageRouteInfo>? children})
      : super(
          FavoritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PokemonDetailView]
class PokemonDetailRoute extends _i6.PageRouteInfo<PokemonDetailRouteArgs> {
  PokemonDetailRoute({
    _i7.Key? key,
    required _i8.PokemonListModelResults item,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          PokemonDetailRoute.name,
          args: PokemonDetailRouteArgs(
            key: key,
            item: item,
          ),
          initialChildren: children,
        );

  static const String name = 'PokemonDetailRoute';

  static const _i6.PageInfo<PokemonDetailRouteArgs> page =
      _i6.PageInfo<PokemonDetailRouteArgs>(name);
}

class PokemonDetailRouteArgs {
  const PokemonDetailRouteArgs({
    this.key,
    required this.item,
  });

  final _i7.Key? key;

  final _i8.PokemonListModelResults item;

  @override
  String toString() {
    return 'PokemonDetailRouteArgs{key: $key, item: $item}';
  }
}

/// generated route for
/// [_i4.PokemonListView]
class PokemonListRoute extends _i6.PageRouteInfo<void> {
  const PokemonListRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PokemonListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PokemonListRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashView]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
