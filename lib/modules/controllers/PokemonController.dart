// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pokemonapp/modules/models/FiturModel.dart';
import 'package:pokemonapp/modules/models/PokeModel.dart';

class PokemonController extends GetxController {
  List<dynamic> pokeList = [].obs;
  List<dynamic> fiturList = [].obs;
  var isLoading = true.obs;
  final current = 0.obs;

  @override
  void onInit() {
    getDataPokemon();
    getFitur();
    super.onInit();
  }

  Future<void> getDataPokemon() async {
    try {
      final jsonData =
          await rootBundle.loadString('assets/json/pokemondumb.json');
      final data = jsonDecode(jsonData);
      pokeList = data['pokemons']
          .map((snapshot) => PokeModel.fromJson(snapshot))
          .toList();

      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }

  Future<void> getFitur() async {
    try {
      final json = await rootBundle.loadString('assets/json/fitur.json');
      final decodedata = jsonDecode(json);
      fiturList =
          decodedata['fitur'].map((val) => FiturModel.fromJson(val)).toList();
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
    }
  }
}
