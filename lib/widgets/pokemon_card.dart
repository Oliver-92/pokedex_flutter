import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'app_theme.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.width,
    required this.pokedex,
    required this.index,
  });

  final double width;
  final List pokedex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: InkWell(
        child: SafeArea(
            child: Stack(
          children: [
            Container(
              width: width,
              margin: EdgeInsets.only(top: 80),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 90,
                    left: 15,
                    child: Text(
                      pokedex[index]["num"],
                      style: AppTheme.numStyle,
                    ),
                  ),
                  Positioned(
                    top: 130,
                    left: 15,
                    child: Text(
                      pokedex[index]["name"],
                      style: AppTheme.nameStyle,
                    ),
                  ),
                  Positioned(
                    top: 170,
                    left: 15,
                    child: Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        decoration: AppTheme.cardDecoration,
                        child: Text(
                          pokedex[index]["type"][0],
                          style: AppTheme.typeStyle(pokedex, index),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              child: Image.network(
                pokedex[index]["img"],
                height: 180,
                fit: BoxFit.fitHeight,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  if (kDebugMode) {
                    print("Error al cargar imagen: $error");
                  }
                  // Imagen de respaldo si todo lo demás falla
                  return Image.asset(
                    "assets/pokeball.png",
                    height: 180,
                    fit: BoxFit.fitHeight,
                  );
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}
