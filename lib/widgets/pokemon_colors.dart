import 'package:flutter/material.dart';

class PokemonColors {
  // Método para obtener el color basado en el tipo de Pokémon
  static Color getColorByType(String type) {
    switch (type) {
      case "Grass":
        return Colors.greenAccent;
      case "Fire":
        return Colors.redAccent;
      case "Water":
        return Colors.blueAccent;
      case "Poison":
        return Colors.deepPurpleAccent;
      case "Electric":
        return Colors.amber;
      case "Rock":
        return Colors.grey;
      case "Ground":
        return Colors.brown;
      case "Psychic":
        return Colors.indigo;
      case "Bug":
        return Colors.lightGreenAccent;
      case "Fighting":
        return Colors.orangeAccent;
      case "Ghost":
        return Colors.deepPurple;
      case "Normal":
        return Colors.white12;
      case "Ice":
        return Colors.cyanAccent;
      case "Dragon":
        return Colors.deepPurpleAccent.shade700;
      case "Fairy":
        return Colors.pinkAccent;
      case "Steel":
        return Colors.blueGrey;
      case "Dark":
        return Colors.black45;
      case "Flying":
        return Colors.lightBlueAccent;
      default:
        return Colors.pink;
    }
  }

  // Método para obtener el color por índice y lista de pokedex (para mantener compatibilidad)
  static Color getColorByIndex(List pokedex, int index) {
    if (index >= 0 &&
        index < pokedex.length &&
        pokedex[index]["type"] != null &&
        pokedex[index]["type"].isNotEmpty) {
      return getColorByType(pokedex[index]["type"][0]);
    }

    return Colors.pink; // Color por defecto
  }
}
