import 'package:flutter/material.dart';
import 'package:mave/paginas/cardenal.dart';

import 'package:mave/paginas/mariposa.dart';

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
                  backgroundImage: NetworkImage(negocio.imagen),
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
                        } else {
                          // Página por defecto si index no coincide con ninguno de los casos anteriores
                          return cardenal();
                        }
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
          'https://th.bing.com/th/id/R.7c558a9b479820f54283bed61147dbf9?rik=2wFvikyYPPhheg&riu=http%3a%2f%2fupload.wikimedia.org%2fwikipedia%2fcommons%2f3%2f37%2fMariposa_Monarca_(Danaus_plexippus)_(5185513148).jpg&ehk=Z2lq7DQJRqdhOVZxQWg3L42zn%2bj9hd%2b%2bLjgmsUdInLg%3d&risl=1&pid=ImgRaw&r=0'),
  const Negocio(
      Nombre: 'Cardenal Rojo',
      descripcion:
          'El macho canta con un silbido fuerte y claro desde la copa de un árbol u otro punto elevado para delimitar su territorio.',
      imagen:
          'https://inaturalist-open-data.s3.amazonaws.com/photos/1064/large.jpg?1545346629'),
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
