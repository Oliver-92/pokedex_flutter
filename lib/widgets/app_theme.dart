import 'package:flutter/material.dart';
import 'package:flutter_app_05/widgets/pokemon_colors.dart';

class AppTheme {
  static const bgHome = BoxDecoration(
      gradient: LinearGradient(
    colors: [
      Color.fromARGB(255, 128, 64, 48),
      Color.fromARGB(255, 0, 0, 0),
    ],
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
  ));

  static TextStyle titleStyle = TextStyle(
      color: Colors.white24.withAlpha(100),
      fontSize: 30,
      fontWeight: FontWeight.bold);

  static TextStyle numStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Color.fromARGB(255, 128, 64, 48));

  static TextStyle nameStyle = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white54);

  static BoxDecoration cardDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    color: Colors.black.withAlpha(50),
  );

  static TextStyle typeStyle(pokedex, index) {
    return TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: PokemonColors.getColorByIndex(pokedex, index),
        shadows: [
          BoxShadow(
            color: PokemonColors.getColorByIndex(pokedex, index),
            offset: Offset(0, 0),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ]);
  }
}
