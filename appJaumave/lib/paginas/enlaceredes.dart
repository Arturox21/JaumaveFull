import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;
import 'package:mave/paginas/negocios.dart';

class Social extends StatelessWidget {
  const Social({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color.fromARGB(255, 114, 1, 243),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Enlaces de interés'.toUpperCase(),
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
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    child: SizedBox(
                      child: Text(
                        'Gobierno Municipal de Jaumave',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('Gobierno Municipal de Jaumave 2021 - 2024'),
                    leading: Icon(
                      Icons.facebook_outlined,
                      color: Colors.blue,
                      size: 50,
                    ),
                    onTap: () async {
                      Uri uri = Uri.parse(
                        'https://www.facebook.com/GobiernoMunicipalJaumave?locale=es_LA',
                      );
                      if (!await launcher.launchUrl(uri)) {
                        debugPrint(
                            "No se pudo abrir el enlace"); // because the simulator doesn't has the email app
                      }
                    },
                  ),
                ),
                const Divider(color: Colors.black87),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('832 336 0119'),
                    leading: Icon(
                      Icons.phone,
                      color: Colors.blue,
                      size: 50,
                    ),
                    onTap: () async {
                      Uri uri = Uri.parse('tel:832 336 0119');
                      if (!await launcher.launchUrl(uri)) {
                        debugPrint(
                            "Could not launch the uri"); // because the simulator doesn't has the phone app
                      }
                    },
                  ),
                ),
                const Divider(height: 50),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    child: SizedBox(
                      child: Text(
                        'Dirección de Turismo',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('Turismo Jaumave'),
                    leading: Icon(
                      Icons.facebook_outlined,
                      color: Colors.blue,
                      size: 50,
                    ),
                    onTap: () async {
                      Uri uri = Uri.parse(
                        'https://www.facebook.com/profile.php?id=100076333803459&locale=es_LA',
                      );
                      if (!await launcher.launchUrl(uri)) {
                        debugPrint(
                            "No se pudo abrir el enlace"); // because the simulator doesn't has the email app
                      }
                    },
                  ),
                ),
                const Divider(color: Colors.black87),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('832 234 0544'),
                    leading: Icon(
                      Icons.phone,
                      color: Colors.blue,
                      size: 50,
                    ),
                    onTap: () async {
                      Uri uri = Uri.parse('tel:832 234 0544');
                      if (!await launcher.launchUrl(uri)) {
                        debugPrint(
                            "Could not launch the uri"); // because the simulator doesn't has the phone app
                      }
                    },
                  ),
                ),
                const Divider(color: Colors.black87),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('TurisJau2124@outlook.com'),
                    leading: Icon(
                      Icons.mail_outline,
                      color: Colors.red,
                      size: 50,
                    ),
                    onTap: () async {
                      Uri uri = Uri.parse(
                        'mailto: TurisJau2124@outlook.com',
                        //'mailto:info@rapidtech.dev?subject=Flutter Url Launcher&body=Hi, Flutter developer',
                      );
                      if (!await launcher.launchUrl(uri)) {
                        debugPrint(
                            "Could not launch the uri"); // because the simulator doesn't has the email app
                      }
                    },
                  ),
                ),
                const Divider(height: 50),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    child: SizedBox(
                      child: Text(
                        'Tienda Artesanal y Productora 100% Jaumavense',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title:
                        Text('Tienda Artesanal y Productora 100% Jaumavense'),
                    leading: Icon(
                      Icons.facebook_outlined,
                      color: Colors.blue,
                      size: 50,
                    ),
                    onTap: () async {
                      Uri uri = Uri.parse(
                        'https://www.facebook.com/profile.php?id=100088940547860&locale=es_LA',
                      );
                      if (!await launcher.launchUrl(uri)) {
                        debugPrint(
                            "No se pudo abrir el enlace"); // because the simulator doesn't has the email app
                      }
                    },
                  ),
                ),
                const Divider(color: Colors.black87),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('832 234 0544'),
                    leading: Icon(
                      Icons.phone,
                      color: Colors.blue,
                      size: 50,
                    ),
                    onTap: () async {
                      Uri uri = Uri.parse('tel:832 234 0544');
                      if (!await launcher.launchUrl(uri)) {
                        debugPrint(
                            "Could not launch the uri"); // because the simulator doesn't has the phone app
                      }
                    },
                  ),
                ),
                const Divider(color: Colors.black87),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: ListTile(
                    title: Text('turisjau2124@outlook.com'),
                    leading: Icon(
                      Icons.mail_outline,
                      color: Colors.red,
                      size: 50,
                    ),
                    onTap: () async {
                      Uri uri = Uri.parse(
                        'mailto: turisjau2124@outlook.com',
                        //'mailto:info@rapidtech.dev?subject=Flutter Url Launcher&body=Hi, Flutter developer',
                      );
                      if (!await launcher.launchUrl(uri)) {
                        debugPrint(
                            "Could not launch the uri"); // because the simulator doesn't has the email app
                      }
                    },
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        //shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        backgroundColor: Colors.black, // <-- Button color
                        foregroundColor: Colors.red, // <-- Splash color
                      ),
                      child: Link(
                          target: LinkTarget.self,
                          uri: Uri.parse("http://www.jaumave.gob.mx/"),
                          builder: (context, followLink) => GestureDetector(
                                onTap: followLink,
                                child: Text("Visita el sitio web",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        //fontStyle: FontStyle.,
                                        color: Colors.white)),
                              )),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                    )
                  ],
                ),
              ],
            ),
          )));
}
