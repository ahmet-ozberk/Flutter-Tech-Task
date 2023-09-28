import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/api/response/pokemon_list_model.dart';
import '../../../../app/services/local_storage_service.dart';

final addFavoriteProvider =
    Provider.family.autoDispose((ref, PokemonListModelResults item) async {
  ref.invalidate(getFavoriteProvider);
  return LocalStorageService.addFavorites(item);
});

final getFavoriteProvider = FutureProvider.autoDispose((ref) async {
  return await LocalStorageService.getFavorites();
});

final removeFavoriteProvider =
    Provider.family.autoDispose((ref, PokemonListModelResults item) async {
  ref.invalidate(getFavoriteProvider);
  return await LocalStorageService.removeFavorites(item);
});

final hasFavoriteProvider = FutureProvider.family
    .autoDispose((ref, PokemonListModelResults item) async {
  return await LocalStorageService.hasFavorite(item);
});
