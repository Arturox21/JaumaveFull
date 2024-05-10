import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:mave/paginas/negocios.dart';

class mariposa extends StatelessWidget {
  const mariposa({super.key});

  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'MARIPOSA MONARCA 3D'.toUpperCase(),
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
              showSearch(context: context, delegate: NegociosSearchDelegate());
            },
          ),
        ],
      ),
      body: ModelViewer(src: 'assets/mariposa.glb', ar: true));

  /*@override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ModelViewer(src: 'assets/mariposa.glb', ar: true));
  }*/
}
