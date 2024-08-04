import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

//import 'package:mave/paginas/negocios.dart';
class Oso extends StatelessWidget {
  const Oso({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          centerTitle: true,
          elevation: 0.0,
          title: Text(
            'Oso negro 3D'.toUpperCase(),
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
            IconButton(
              icon: const Icon(
                Icons.info_outline,
                color: Colors.black,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Realidad Aumentada'),
                      content: SingleChildScrollView(
                        child: ListBody(
                          children: <Widget>[
                            Text(
                                '1. Toca el botón de la parte inferior derecha. \n\n 2. Mueve el dispositivo hacia la izquierda y hacia la derecha como se te indica (sobre una superficie plana) \n\n 3. Una vez aparezca el objeto, puedes cambiar su tamaño y posición deslizando con los dedos. \n\n 4. Toca el botón una vez para tomar una foto, o mantén presionado para tomar un video. \n\n\n *Algunos dispositivos podrían no ser compatibles con esta tecnología.'),
                            // Puedes agregar más textos o widgets aquí
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Cerrar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: ModelViewer(
          src:
              'https://raw.githubusercontent.com/Arturox21/Model3DJaumave/main/oso.glb',
          ar: true,
          arModes: ['scene-viewer', 'webxr', 'quick-look'],
          autoRotate: false,

          ///iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
          disableZoom: false,
        ));
  }
}

class NegociosSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}

  /*@override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ModelViewer(src: 'assets/mariposa.glb', ar: true));
  }*/

