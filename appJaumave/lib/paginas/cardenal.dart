import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
//import 'package:flutter/material.dart';
//import 'package:url_launcher/link.dart';
//import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:mave/paginas/negocios.dart';

class cardenal extends StatelessWidget {
  const cardenal({super.key});

  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'CARDENAL ROJO 3D'.toUpperCase(),
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
      body: ModelViewer(src: 'assets/cardenal.glb', ar: true));
}
