import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/api/response/pokemon_list_model.dart';
import '../../../../app/services/dio_services.dart';
import '../../../widgets/app_toast.dart';

final pokemonListProvider = FutureProvider.autoDispose((ref) async {
  return await DioService.request(path: '').responseHandler<PokemonListModel>(
    success: (response) => PokemonListModel.fromJson(response.data),
    error: (err) => Toast.show(err.message),
  );
});
