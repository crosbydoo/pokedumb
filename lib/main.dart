import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemonapp/modules/views/Detail.dart';
import 'package:pokemonapp/modules/views/Home.dart';
import 'package:pokemonapp/modules/views/MainMenu.dart';
import 'package:pokemonapp/utils/Introduction.dart';
import 'package:pokemonapp/utils/Login.dart';
import 'package:pokemonapp/utils/SplashScreen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/main': (context) => const MainMenu(),
        '/home': (context) => const HomeView(),
        '/start': (context) => const LoginView(),
        '/intro': (context) => const IntroductionView(),
        '/detail': (context) => const DetailView(),
      },
    ),
  );
}
