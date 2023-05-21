// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokemonapp/modules/controllers/GlobalController.dart';
import 'package:pokemonapp/modules/controllers/PokemonController.dart';
import 'package:pokemonapp/utils/Greeting.dart';
import 'package:recase/recase.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final gController = Get.put(GlobalController());
  final poke = Get.put(PokemonController());
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    Widget heading() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              text: 'Poke',
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
              children: [
                TextSpan(
                  text: 'dumb',
                  style: GoogleFonts.poppins(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: Image.asset(
              'assets/images/pokeball.png',
              scale: 15,
            ),
          ),
        ],
      );
    }

    Widget greet() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Halo, ${gController.name.value.titleCase}',
            style: GoogleFonts.poppins(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.red,
            ),
          ),
          Text(
            greeting(),
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      );
    }

    Widget carousel() {
      return Obx(
        () {
          if (poke.isLoading.value) {
            return const CircularProgressIndicator();
          } else {
            return Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(top: 40, right: 20),
                  child: SizedBox(
                    width: 150,
                    child: Text(
                      'Temukan pokemon andalan kalian',
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: CarouselSlider.builder(
                    itemCount: poke.pokeList.length,
                    itemBuilder: (context, index, realIndex) {
                      var getPoke = poke.pokeList[index];
                      var hexa = int.parse(getPoke.color);
                      return Column(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(hexa),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    getPoke.image,
                                    scale: 2.5,
                                  ),
                                  Text(
                                    getPoke.name,
                                    style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    options: CarouselOptions(
                      aspectRatio: 2.0,
                      autoPlay: true,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          poke.current.value = index;
                        });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: poke.pokeList.asMap().entries.map((val) {
                    return GestureDetector(
                      onTap: () => _controller.animateToPage(val.key),
                      child: Container(
                        height: 8,
                        width: 8,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              (Theme.of(context).brightness == Brightness.dark
                                      ? Colors.black
                                      : Colors.red)
                                  .withOpacity(
                            poke.current.value == val.key ? 0.9 : 0.4,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )
              ],
            );
          }
        },
      );
    }

    void dialogPop(
        BuildContext context, String selectedTitle, String contentBody) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(selectedTitle),
            content: Text(contentBody),
          );
        },
      );
    }

    Widget features() {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Fitur',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 180,
              child: Obx(() {
                if (poke.isLoading.value) {
                  return const CircularProgressIndicator();
                } else {
                  return RefreshIndicator(
                    onRefresh: poke.getFitur,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: poke.fiturList.length,
                      itemBuilder: (context, index) {
                        var fitur = poke.fiturList[index];
                        var hexax = int.parse(fitur.color);
                        return Container(
                          width: 300,
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Color(hexax),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                'Temukan berdasarkan',
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            subtitle: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    String selectedTitle = fitur.title;
                                    String contentBody = fitur.content;
                                    return dialogPop(
                                        context, selectedTitle, contentBody);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 100,
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      fitur.title,
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                Image.asset(
                                  fitur.img,
                                  height: 130,
                                  width: 130,
                                  alignment: Alignment.center,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(
            top: 20,
            right: 30,
            left: 30,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                heading(),
                const SizedBox(height: 15),
                greet(),
                carousel(),
                features(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
