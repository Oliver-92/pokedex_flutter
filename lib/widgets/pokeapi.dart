import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class PokeApiService {
  // Método para obtener la lista de Pokémon
  static Future<List> fetchPokemonList() async {
    var url = Uri.https("raw.githubusercontent.com",
        "/Biuni/PokemonGO-Pokedex/master/pokedex.json");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List pokemonList = data["pokemon"];

        // Reemplazar todas las URLs con una fuente alternativa
        for (var pokemon in pokemonList) {
          // Extraer el número de Pokémon del campo num
          String pokemonNumber = pokemon["num"].padLeft(3, '0');

          // Usar PokeAPI como fuente alternativa
          pokemon["img"] =
              "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${int.parse(pokemonNumber)}.png";
        }

        return pokemonList;
      } else {
        if (kDebugMode) {
          print("Error al cargar los datos: ${response.statusCode}");
        }
        return [];
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error en la petición: $e");
      }
      return [];
    }
  }
}
