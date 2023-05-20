// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

class IntroductionView extends StatefulWidget {
  const IntroductionView({super.key});

  @override
  State<IntroductionView> createState() => _IntroductionViewState();
}

class _IntroductionViewState extends State<IntroductionView> {
  List<PageViewModel> listPageViewModel = [
    PageViewModel(
      titleWidget: Text(
        'Pokemon',
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      bodyWidget: Text(
        'Monster yang memiliki kekuatan unik dan akan bertambah seiring dengan evolusinya',
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.red,
        ),
        textAlign: TextAlign.center,
      ),
      image: Lottie.asset(
        'assets/json/pokemon.json',
        height: 150,
        width: 150,
      ),
    ),
    PageViewModel(
      titleWidget: Text(
        'Pokedex',
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      bodyWidget: Text(
        'Temukan pokemon yang anda sukai dengan pokedex',
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.red,
        ),
        textAlign: TextAlign.center,
      ),
      image: Lottie.asset(
        'assets/json/selection-list.json',
        height: 200,
        width: 200,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: IntroductionScreen(
            pages: listPageViewModel,
            dotsDecorator: const DotsDecorator(
              color: Colors.black,
              activeColor: Colors.red,
            ),
            showSkipButton: true,
            showNextButton: false,
            skip: Text(
              "Lewati",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
            done: Text(
              "Mulai",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ),
            onDone: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/start', (route) => false);
            },
          ),
        ),
      ),
    );
  }
}
