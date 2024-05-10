import 'package:flutter/material.dart';
import 'package:mave/paginas/negocios.dart';

class AcercaPage extends StatelessWidget {
  const AcercaPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 236, 236),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            'Acerca de'.toUpperCase(),
            style: const TextStyle(
              fontSize: 15,
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.white,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                showSearch(
                    context: context, delegate: NegociosSearchDelegate());
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: const SafeArea(
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                    child: Column(
                      children: [
                        Text(
                          'Jaumave es un municipio de Tamaulipas en nuestro país México, ubicada en el suroeste del estado y es cabecera del municipio del mismo nombre, es uno de los 43 municipios en que se encuentra dividido el estado mexicano de Tamaulipas, se caracteriza por abarca una gran extensión de la Sierra Madre Oriental.',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'El Gobierno Municipal de Jaumave, de la mano de la Dirección de Turismo, trabaja para mejorar la experiencia de los visitantes, brindándoles una herramienta que les permite encontrar recomendaciones y opciones de acuerdo a sus necesidades.',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Misión",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Servir eficientemente con transparencia e imparcialidad a la población, contribuyendo al desarrollo integral, mediante un crecimiento sostenido y sustentable de la ciudad, mediante un servicio de calidad a través de una gestión Municipal democrática, equitativa, participativa e incluyente, además desarrollando un gobierno comprometido con el desarrollo ambiental, histórico, turístico, cultural y con equidad de género, otorgándoles calidad de vida a los ciudadanos y ciudadanas, con un trato justo y de igualdad social, brindando dignidad y respeto a través de los servicios públicos.",
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      );
}
