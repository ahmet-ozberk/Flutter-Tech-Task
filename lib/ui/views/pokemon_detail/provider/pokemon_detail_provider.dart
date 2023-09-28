import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../app/api/response/pokemon_detail_model.dart';

import '../../../../app/services/dio_services.dart';
import '../../../widgets/app_toast.dart';

final pokemonDetailProvider = FutureProvider.family.autoDispose((ref, String id)async{
    return await DioService.request(path: '/$id').responseHandler<PokemonDetailModel>(
    success: (response) => PokemonDetailModel.fromJson(response.data),
    error: (err) => Toast.show(err.message),
  );
});