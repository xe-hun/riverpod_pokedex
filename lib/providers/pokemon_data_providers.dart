import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:poki_dex/models/pokemon.dart';
import 'package:poki_dex/services/http_service.dart';

final pokemonDataProvider =
    FutureProvider.family<Pokemon?, String>((ref, url) async {
  HTTPService httpService = GetIt.instance.get<HTTPService>();
  Response? res = await httpService.get(
    url,
  );
  if (res != null && res.data != null) {
    return Pokemon.fromJson(res.data!);
  }
  return null;
});
