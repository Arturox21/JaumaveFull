import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mave/paginas/cardenal.dart';
import 'package:mave/paginas/guacamaya.dart';
import 'package:mave/paginas/mapa.dart';
import 'package:mave/paginas/mariposa.dart';
import 'package:mave/paginas/oso.dart';
import 'package:mave/paginas/taza.dart';

class apartadoRA extends StatelessWidget {
  const apartadoRA({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 180, 235, 252),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'RA Turística'.toUpperCase(),
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: ListView.builder(
          itemCount: negocios.length,
          itemBuilder: (context, index) {
            final negocio = negocios[index];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: CachedNetworkImageProvider(negocio.imagen),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(negocio.Nombre),
                subtitle: Text(negocio.descripcion),
                trailing: const Icon(Icons.camera_alt),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        if (index == 0) {
                          // Página a la que quieres dirigir si index es 0
                          return mariposa();
                        }
                        if (index == 1) {
                          // Página por defecto si index no coincide con ninguno de los casos anteriores
                          return cardenal();
                        }
                        if (index == 2) {
                          // Página por defecto si index no coincide con ninguno de los casos anteriores
                          return Oso();
                        }
                        if (index == 3) {
                          // Página por defecto si index no coincide con ninguno de los casos anteriores
                          return Guacamaya();
                        }
                        if (index == 4) {
                          // Página por defecto si index no coincide con ninguno de los casos anteriores
                          return Mapa();
                        }
                        return Taza();
                      },
                    ),
                  );
                },
              ),
            );
          }),
    );
  }
}

List<Negocio> negocios = [
  const Negocio(
      Nombre: 'Mariposa Monarca',
      descripcion:
          'Es quizás la más conocida de todas las mariposas de América del Norte.',
      imagen:
          'https://drive.google.com/uc?export=view&id=15c-iCen-KhFYIH572UVYhvV2cdSvOsOM'),
  const Negocio(
      Nombre: 'Cardenal Rojo',
      descripcion:
          'El macho canta con un silbido fuerte y claro desde la copa de un árbol u otro punto elevado para delimitar su territorio.',
      imagen:
          'https://drive.google.com/uc?export=view&id=1iWBL9bhAdCk-x8oVbrMrEcJLXikNqFoC'),
  const Negocio(
      Nombre: 'Oso Negro',
      descripcion:
          'Son conocidos por su pelaje negro o marrón oscuro y su hábitat incluye bosques, montañas y áreas boscosas.',
      imagen:
          'https://drive.google.com/uc?export=view&id=1hjCIPjk1EcT7uUHS6wlU3MRuA0qmIKvH'),
  const Negocio(
      Nombre: 'Guacamaya',
      descripcion:
          'Tienen plumajes brillantes en tonos rojos, azules y verdes.',
      imagen:
          'https://drive.google.com/uc?export=view&id=16YqheD75McgaY6tg55gBMrpOJ0d5TnzI'),
  const Negocio(
      Nombre: 'Area de la mariposa monarca',
      descripcion:
          'La reserva fue establecida en 1980 y ha evolucionado para proteger a estas maravillosas criaturas.',
      imagen:
          'https://drive.google.com/uc?export=view&id=1A4TIYOaseDx2wSBLeTyPLHikNQ5PgOrd'),
  const Negocio(
      Nombre: 'Taza de recuerdo',
      descripcion:
          'Las tazas de recuerdo suelen ser objetos decorativos o prácticos que las personas compran como recuerdo de un lugar o experiencia especial.',
      imagen:
          'https://drive.google.com/uc?export=view&id=1wTlZB9lNZARvphc8xCBQ1MJmGAEyeFyg'),
];

class Negocio {
  final String Nombre;
  final String descripcion;
  final String imagen;

  const Negocio({
    required this.Nombre,
    required this.descripcion,
    required this.imagen,
  });
}
