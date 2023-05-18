import 'package:flutter/material.dart';
import 'package:pokemonapp/modules/view/Home.dart';
import 'package:pokemonapp/utils/MainMenu.dart';
import 'package:pokemonapp/utils/SplashScreen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/main': (context) => const MainMenuView(),
        '/home': (context) => const HomeView(),
      },
    ),
  );
}
