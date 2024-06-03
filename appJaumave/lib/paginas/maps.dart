/* import 'dart:io'; */
import 'package:flutter/material.dart';
/* import 'package:mave/main.dart'; */

//import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mave/paginas/negocios.dart';

class Maps extends StatelessWidget {
  const Maps({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Google Maps'.toUpperCase(),
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
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Scaffold(
            body: ListView(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('Parador Turístico "Las Guacamayas"'),
                    subtitle: Text(
                        'Ignacio Zaragoza #104 entre Francisco villa y blvd Jaumave'),
                    leading: Icon(
                      Icons.pin_drop_rounded,
                      color: Colors.black,
                    ),
                    onTap: () async {
                      const urlMap =
                          "https://www.google.com/maps/search/?api=1&query=23.410790705205027,-99.37884830279478";
                      if (await canLaunchUrl(Uri.parse(urlMap))) {
                        await launchUrl(Uri.parse(urlMap));
                      } else {
                        throw 'No se pudo abrir el mapa';
                      }
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('Parroquia de la Inmaculada Concepción'),
                    subtitle: Text(
                        'Calle Nicolás Bravo entre calle Hidalgo y Obregón'),
                    leading: Icon(
                      Icons.church,
                      color: Colors.black,
                    ),
                    onTap: () async {
                      const urlMap =
                          "https://www.google.com/maps/search/?api=1&query=23.406154346160545,-99.37481645262115";
                      if (await canLaunchUrl(Uri.parse(urlMap))) {
                        await launchUrl(Uri.parse(urlMap));
                      } else {
                        throw 'No se pudo abrir el mapa';
                      }
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('El Charco Azul'),
                    subtitle: Text('Ejido Padrón y Juárez'),
                    leading: Icon(
                      Icons.water,
                      color: Colors.black,
                    ),
                    onTap: () async {
                      const urlMap =
                          "https://www.google.com/maps/search/?api=1&query=23.362527056595212,-99.44690237519752";
                      if (await canLaunchUrl(Uri.parse(urlMap))) {
                        await launchUrl(Uri.parse(urlMap));
                      } else {
                        throw 'No se pudo abrir el mapa';
                      }
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('Balneario El Ojito'),
                    subtitle: Text('Camino antiguo al Ej. Matías García'),
                    leading: Icon(
                      Icons.water,
                      color: Colors.black,
                    ),
                    onTap: () async {
                      const urlMap =
                          "https://www.google.com/maps/search/?api=1&query=23.409197549205775,-99.39651947625748";
                      if (await canLaunchUrl(Uri.parse(urlMap))) {
                        await launchUrl(Uri.parse(urlMap));
                      } else {
                        throw 'No se pudo abrir el mapa';
                      }
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('Balneario Los Nogales'),
                    subtitle:
                        Text('Ejido Salamanca, 11 km de la cabecera municipal'),
                    leading: Icon(
                      Icons.water,
                      color: Colors.black,
                    ),
                    onTap: () async {
                      const urlMap =
                          "https://www.google.com/maps/search/?api=1&query=23.439061464597952,-99.2693990003138";
                      if (await canLaunchUrl(Uri.parse(urlMap))) {
                        await launchUrl(Uri.parse(urlMap));
                      } else {
                        throw 'No se pudo abrir el mapa';
                      }
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('Viñedo Monterredondo'),
                    subtitle: Text(
                        'km 105 carretera Victoria – Tula Ej. Monterredondo'),
                    leading: Icon(
                      Icons.wine_bar,
                      color: Colors.black,
                    ),
                    onTap: () async {
                      const urlMap =
                          "https://www.google.com/maps/search/?api=1&query=23.383365,-99.443294";
                      if (await canLaunchUrl(Uri.parse(urlMap))) {
                        await launchUrl(Uri.parse(urlMap));
                      } else {
                        throw 'No se pudo abrir el mapa';
                      }
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('Río Guayalejo'),
                    subtitle: Text('Calle Nicolás Bravo'),
                    leading: Icon(
                      Icons.water,
                      color: Colors.black,
                    ),
                    onTap: () async {
                      const urlMap =
                          "https://www.google.com/maps/search/?api=1&query=23.39682961640475,-99.37504153196284";
                      if (await canLaunchUrl(Uri.parse(urlMap))) {
                        await launchUrl(Uri.parse(urlMap));
                      } else {
                        throw 'No se pudo abrir el mapa';
                      }
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('Centro Recreativo El Lago'),
                    subtitle: Text('Camino a San Juanito, Jaumave Tamaulipas'),
                    leading: Icon(
                      Icons.water,
                      color: Colors.black,
                    ),
                    onTap: () async {
                      const urlMap =
                          "https://www.google.com/maps/search/?api=1&query=23.408207695610912,-99.38935350870868";
                      if (await canLaunchUrl(Uri.parse(urlMap))) {
                        await launchUrl(Uri.parse(urlMap));
                      } else {
                        throw 'No se pudo abrir el mapa';
                      }
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('Rancho Los Primos'),
                    subtitle: Text(
                        'Entrada al Ejido Matías García a 600mts de la carretera nacional'),
                    leading: Icon(
                      Icons.house,
                      color: Colors.black,
                    ),
                    onTap: () async {
                      const urlMap =
                          "https://www.google.com/maps/search/?api=1&query=23.392150254704084,-99.43337067646716";
                      if (await canLaunchUrl(Uri.parse(urlMap))) {
                        await launchUrl(Uri.parse(urlMap));
                      } else {
                        throw 'No se pudo abrir el mapa';
                      }
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('Hacienda y Spa la Florida'),
                    subtitle: Text('Carretera Victoria – Tula km 97'),
                    leading: Icon(
                      Icons.spa_rounded,
                      color: Colors.black,
                    ),
                    onTap: () async {
                      const urlMap =
                          "https://www.google.com/maps/search/?api=1&query=23.387223910546325,-99.5025507768733";
                      if (await canLaunchUrl(Uri.parse(urlMap))) {
                        await launchUrl(Uri.parse(urlMap));
                      } else {
                        throw 'No se pudo abrir el mapa';
                      }
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('Ejido Magdaleno Aguilar'),
                    subtitle:
                        Text('A 20 km de la cabecera municipal de Jaumave'),
                    leading: Icon(
                      Icons.house,
                      color: Colors.black,
                    ),
                    onTap: () async {
                      const urlMap =
                          "https://www.google.com/maps/search/?api=1&query=23.453802991166295,-99.55803356622143";
                      if (await canLaunchUrl(Uri.parse(urlMap))) {
                        await launchUrl(Uri.parse(urlMap));
                      } else {
                        throw 'No se pudo abrir el mapa';
                      }
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('Ejido 20 de Abril'),
                    subtitle: Text('27 km al sur de la cabecera municipal'),
                    leading: Icon(
                      Icons.house,
                      color: Colors.black,
                    ),
                    onTap: () async {
                      const urlMap =
                          "https://www.google.com/maps/search/?api=1&query=23.170631293081673,-99.30012325881141";
                      if (await canLaunchUrl(Uri.parse(urlMap))) {
                        await launchUrl(Uri.parse(urlMap));
                      } else {
                        throw 'No se pudo abrir el mapa';
                      }
                    },
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('NCPE Sierra Madre'),
                    subtitle: Text('Carretera antigua Cd. Victoria - Tula'),
                    leading: Icon(
                      Icons.house,
                      color: Colors.black,
                    ),
                    onTap: () async {
                      const urlMap =
                          "https://www.google.com/maps/search/?api=1&query=23.629372462227813,-99.24571350692712";
                      if (await canLaunchUrl(Uri.parse(urlMap))) {
                        await launchUrl(Uri.parse(urlMap));
                      } else {
                        throw 'No se pudo abrir el mapa';
                      }
                    },
                  ),
                ),
              ],
            ),
          )));
}
