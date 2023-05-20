// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemonapp/modules/controllers/GlobalController.dart';
import 'package:pokemonapp/modules/controllers/PokemonController.dart';

class PokeDataView extends StatefulWidget {
  const PokeDataView({super.key});

  @override
  State<PokeDataView> createState() => _PokeDataViewState();
}

class _PokeDataViewState extends State<PokeDataView> {
  final pokeController = Get.put(PokemonController());
  final gController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    Widget heading() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            RichText(
              text: TextSpan(
                text: 'Poke',
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
                children: [
                  TextSpan(
                    text: 'dex',
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.catching_pokemon_rounded,
              color: Colors.red,
              size: 30,
            )
          ],
        ),
      );
    }

    Widget pokedex() {
      return Expanded(
        child: Obx(
          () {
            if (pokeController.isLoading.value) {
              return const CircularProgressIndicator();
            } else {
              return RefreshIndicator(
                onRefresh: pokeController.getDataPokemon,
                child: ListView.builder(
                  itemCount: pokeController.pokeList.length,
                  itemBuilder: (context, index) {
                    var pokemon = pokeController.pokeList[index];
                    var hexa = int.parse(pokemon.color);
                    return InkWell(
                      onTap: () {
                        Get.toNamed('/detail', arguments: pokemon);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 20),
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Color(hexa),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                pokemon.name,
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 45,
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      pokemon.category,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 60),
                                    height: 100,
                                    width: 100,
                                    child: Image.asset(pokemon.image),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            heading(),
            pokedex(),
          ],
        ),
      ),
    );
  }
}
