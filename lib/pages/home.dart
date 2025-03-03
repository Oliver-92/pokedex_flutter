import 'package:flutter/material.dart';
import 'package:flutter_app_05/widgets/pokeapi.dart';
import 'package:flutter_app_05/widgets/pokemon_card.dart';
import 'package:flutter_app_05/widgets/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List pokedex = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (mounted) {
      _loadPokemonData();
    }
  }

  // Método para cargar los datos
  void _loadPokemonData() async {
    setState(() {
      isLoading = true;
    });

    final pokemonList = await PokeApiService.fetchPokemonList();

    setState(() {
      pokedex = pokemonList;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        width: width,
        height: height,
        decoration: AppTheme.bgHome,
        child: Stack(
          children: [
            Positioned(
              top: -50,
              right: -50,
              child: Image.asset(
                "assets/pokeball.png",
                width: 170,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: 100,
              left: 20,
              child: Text(
                "Pokedex",
                style: AppTheme.titleStyle,
              ),
            ),
            Positioned(
                top: 150,
                bottom: 0,
                width: width,
                child: Column(
                  children: [
                    // ignore: unnecessary_null_comparison
                    pokedex != null
                        ? Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 250,
                                childAspectRatio: 3 / 5,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemCount: pokedex.length,
                              itemBuilder: (context, index) {
                                return PokemonCard(
                                  width: width,
                                  pokedex: pokedex,
                                  index: index,
                                );
                              },
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
