import 'dart:convert';

import '../api/response/pokemon_list_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static Future<SharedPreferences> get _instance async =>
      _prefs ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> initPrefs() async {
    _prefs = await _instance;
    return _prefs!;
  }

  static Future<void> setString(String key, String value) async {
    var prefs = await _instance;
    prefs.setString(key, value);
    return;
  }

  static Future<String?> getString(String key) async {
    var prefs = await _instance;
    return prefs.getString(key);
  }

  static Future<void> setBool(String key, bool value) async {
    var prefs = await _instance;
    prefs.setBool(key, value);
    return;
  }

  static Future<bool?> getBool(String key) async {
    var prefs = await _instance;
    return prefs.getBool(key);
  }

  static Future<void> setInt(String key, int value) async {
    var prefs = await _instance;
    prefs.setInt(key, value);
    return;
  }

  static Future<int?> getInt(String key) async {
    var prefs = await _instance;
    return prefs.getInt(key);
  }

  static Future<void> setDouble(String key, double value) async {
    var prefs = await _instance;
    prefs.setDouble(key, value);
    return;
  }

  static Future<double?> getDouble(String key) async {
    var prefs = await _instance;
    return prefs.getDouble(key);
  }

  /// set pokemon response[lib/app/api/response/pokemon_list_model.dart] value
  static Future<void> addFavorites(PokemonListModelResults value) async {
    var prefs = await _instance;
    final list = prefs.getStringList("favorites");
    if (list != null) {
      list.add(jsonEncode(value.toJson()));
      prefs.setStringList("favorites", list);
    } else {
      prefs.setStringList("favorites", [jsonEncode(value.toJson())]);
    }
    return;
  }

  /// get pokemon response[lib/app/api/response/pokemon_list_model.dart] value
  static Future<List<PokemonListModelResults?>?> getFavorites() async {
    var prefs = await _instance;
    final list = prefs.getStringList("favorites");
    if (list != null) {
      return list
          .map((e) => PokemonListModelResults.fromJson(jsonDecode(e)))
          .toList();
    }
    return null;
  }

  /// remove pokemon response[lib/app/api/response/pokemon_list_model.dart] value
  static Future<void> removeFavorites(PokemonListModelResults value) async {
    var prefs = await _instance;
    final list = prefs.getStringList("favorites");
    if (list != null) {
      list.removeWhere((element) => element == jsonEncode(value.toJson()));
      prefs.setStringList("favorites", list);
    }
    return;
  }

  /// has favorite PokemonListModelResults
  static Future<bool> hasFavorite(PokemonListModelResults value) async {
    var prefs = await _instance;
    final list = prefs.getStringList("favorites");
    if (list != null) {
      return list.any((element) => element == jsonEncode(value.toJson()));
    }
    return false;
  }

  static Future<void> clearKey(String key) async {
    var prefs = await _instance;
    prefs.remove(key);
    return;
  }

  static void clearAll() {
    _prefs!.clear();
  }
}
