import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:mave/modelos/Lugares.dart';
import 'package:mave/modelos/categoriamodel.dart';
import 'package:mave/paginas/ListScreenArtesanias.dart';
import 'package:mave/paginas/ListScreenComida.dart';
import 'package:mave/paginas/ListScreenTurismo.dart';
import 'package:mave/paginas/ListscreenHospedaje.dart';
import 'package:mave/paginas/ListscreenLugares.dart';
import 'package:mave/paginas/cardenal.dart';
import 'package:mave/paginas/mariposa.dart';
//import 'package:mave/widgets/shared/theme.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:card_swiper/card_swiper.dart';

//import 'package:mave/widgets/shared/theme.dart';

class Categoryy {
  final String id;
  final String title;
  final String image;
  final TextStyle textStyle;
  final Color color;

  final ScrollController scrollController;

  Categoryy({
    required this.id,
    required this.title,
    required this.image,
    required this.textStyle,
    required this.color,
  }) : scrollController = ScrollController();
}

class Userprincipal extends StatelessWidget {
  final List<Categoryy> categoriies = [
    Categoryy(
        id: '1',
        title: 'Atractivos \n Turísticos',
        image: 'lib/images/biodiversidad.png',
        textStyle: const TextStyle(
          fontSize: 14,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
        color: Color.fromARGB(255, 124, 99, 233)),
    Categoryy(
        id: '2',
        title: 'Hospedaje',
        image: 'lib/images/hospedaje.png',
        textStyle: const TextStyle(
          fontSize: 14,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
        //color: Color.fromARGB(255, 235, 205, 185)),
        color: Color.fromARGB(255, 253, 186, 141)),
    Categoryy(
        id: '3',
        title: 'Gastronomía',
        image: 'lib/images/restaurant.png',
        textStyle: const TextStyle(
          fontSize: 14,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
        color: Color.fromARGB(255, 226, 126, 126)),
    Categoryy(
        id: '4',
        title: 'Biodiversidad',
        image: 'lib/images/emblematicos.png',
        textStyle: const TextStyle(
          fontSize: 14,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
        color: Color.fromARGB(255, 93, 167, 117)),
    Categoryy(
        id: '5',
        title: 'Artesanías',
        image: 'lib/images/artesanos.png',
        textStyle: const TextStyle(
          fontSize: 14,
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
        ),
        color: Color.fromARGB(255, 139, 67, 187)),
    // Agrega más categorías con imágenes según sea necesario
  ];

  Future<List<Category>> getTrending() async {
    final response = await http.get(
        Uri.parse('https://api.jaumaveonline.com:8463/api/post?trending=true'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List<dynamic>;
      List<Category> events =
          data.map((json) => Category.fromJson(json)).toList();
      return events;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  Userprincipal({super.key});

  @override
  Widget build(BuildContext context) {
    final Future<List<dynamic>> trending = getTrending();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 255, 242),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  child: SizedBox(
                    child: Text(
                      'Destacados',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: 'Futura',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              FutureBuilder(
                  future: trending,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const SizedBox(
                          height: 250,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ));
                    } else if (snapshot.hasError || snapshot.data == null) {
                      return const SizedBox(
                          height: 250,
                          child: Center(
                            child: Text('Error al cargar datos'),
                          ));
                    } else {
                      return CarouselSlider(
                        options: CarouselOptions(
                          aspectRatio: 1.5,
                          viewportFraction: 0.9,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          enableInfiniteScroll: false,
                          autoPlay: true,
                        ),
                        items: snapshot.data!
                            .map<Widget>(
                                (item) => HeroCarouselCard(category: item))
                            .toList(),
                      );
                    }
                  }),
              const SizedBox(
                height: 20.0,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal:
                          20), // Ajusta los valores según el espacio que desees agregar
                  child: SizedBox(
                    child: Text(
                      'Categorías',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'Futura',
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                  height: 130,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoriies.length,
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => TurismoScreen(
                                    category: categoriies[index])),
                          );
                        } else if (index == 1) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => HospedajeScreen(
                                    category: categoriies[index])),
                          );
                        } else if (index == 2) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    ComidaScreen(category: categoriies[index])),
                          );
                        } else if (index == 3) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => LugaresScreen(
                                    category: categoriies[index])),
                          );
                        } else if (index == 4) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => ArtesaniaScreen(
                                    category: categoriies[index])),
                          );
                        }
                      },
                      child: Padding(
                        padding:
                            const EdgeInsets.only(right: 12, bottom: 8, top: 8),
                        child: Material(
                          elevation: 3,
                          color: categoriies[index].color,
                          borderRadius: BorderRadius.circular(30),
                          shadowColor: Colors.black,
                          child: SizedBox(
                            height: 100,
                            width: 120,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  categoriies[index].image,
                                  width: 42,
                                  height: 42,
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  categoriies[index].title,
                                  style: categoriies[index].textStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )),

              const SizedBox(height: 28),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal:
                          20), // Ajusta los valores según el espacio que desees agregar
                  child: SizedBox(
                    child: Text(
                      '¿Estás listo para vivir la mejor experiencia de tu vida? / Are you ready to live the best experience of your life?',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'TitanOne',
                        //fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 70, 4, 124),
                      ),
                    ),
                  ),
                ),
              ),

              //const SizedBox(height: 28),
              const Divider(height: 50),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 280,
                child: ModelosView(),
              ),

              const Divider(
                height: 10,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: VideoCarousel(),
              ),

              const SizedBox(height: 28),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 105,
                  child: ImageOnTapWidget(
                    imageUrl:
                        'http://www.jaumave.gob.mx/wp-content/uploads/sites/13/2022/05/slider_jaumave_2400x600-04-850x300.jpg',
                    mapUrl: 'http://www.jaumave.gob.mx/turismo/',
                  ),
                ),
              ),

              const SizedBox(height: 28),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 280,
                child: ImageCarousel(),
              ),

              const Divider(
                height: 50,
              ),
              // Aquí añadimos la imagen debajo de las categorías
              Container(
                //width: MediaQuery.of(context).size.width,
                height: 280,
                child: MyHomePage(),
              ),

              //const SizedBox(height: 28),
              const Divider(
                height: 50,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal:
                          20), // Ajusta los valores según el espacio que desees agregar
                  child: SizedBox(
                    child: Text(
                      'Visita la página oficial / Visit the official website',
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

              const SizedBox(height: 28),
              // Aquí añadimos la imagen debajo de las categorías
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  child: GestureDetector(
                    onTap: () {
                      _launchURL(
                          'http://www.jaumave.gob.mx/turismo/'); // Reemplaza esto con tu URL deseada
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/Monumento.jpg', // Ruta de la imagen local en assets
                        // Ajusta el alto de la imagen según sea necesario
                        fit: BoxFit
                            .cover, // Ajusta el modo de ajuste de la imagen según sea necesario
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal:
                          20), // Ajusta los valores según el espacio que desees agregar
                  child: SizedBox(
                    child: Text(
                      'Tienda Artesanal y Productora 100% Jaumavense / Handicraft products store',
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
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: TiendaArtesanias(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageOnTapWidget extends StatelessWidget {
  final String imageUrl;
  final String mapUrl;

  const ImageOnTapWidget({
    Key? key,
    required this.imageUrl,
    required this.mapUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _launchUrl(mapUrl);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover, // ajusta la imagen al tamaño del contenedor
        ),
      ),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se pudo abrir el enlace';
    }
  }
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'No se pudo abrir la URL: $url';
  }
}

class HeroCarouselCard extends StatelessWidget {
  final Category category;
  const HeroCarouselCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: 20,
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        child: Stack(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl:
                  "https://api.jaumaveonline.com:8463/optimize/${category.imageUrl}",
              fit: BoxFit.cover,
              width: 1000.0,
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(200, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 0),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Text(
                  category.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//CARRUSEL DE VIDEOS

class VideoCarousel extends StatefulWidget {
  @override
  _VideoCarouselState createState() => _VideoCarouselState();
}

class _VideoCarouselState extends State<VideoCarousel> {
  final List<String> videoIds = [
    'wp96XJzwvaI',
    'OangktAl0Z4', // Reemplaza estos IDs con los IDs de tus videos de YouTube
    'i_OVfbDDJDI',
    '8KaNKy5JNk8',
    'Q_5C3TJfG4Q',
    'KN38pc_MyFs',
  ];

  final List<String> videoTitles = [
    'Balneario Los Nogales',
    'Parroquia de La Inmaculada Concepción',
    'Balneario El Ojito',
    'El Charco Azul',
    'Cabañas y Spa La Florida',
    'Viñedo Monterredondo',
  ];

  late List<YoutubePlayerController> _controllers;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controllers = videoIds
        .map<YoutubePlayerController>(
          (videoId) => YoutubePlayerController(
            initialVideoId: videoId,
            flags: YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
              loop: false,
            ),
          )..addListener(() {
              if (_isPlaying !=
                  _controllers
                      .any((controller) => controller.value.isPlaying)) {
                setState(() {
                  _isPlaying = _controllers
                      .any((controller) => controller.value.isPlaying);
                });
              }
            }),
        )
        .toList();
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 255, 242),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 212, 255, 242),
        title: Text(
          'Descubre Jaumave',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: CarouselSlider.builder(
        itemCount: _controllers.length,
        options: CarouselOptions(
          height: 450.0,
          enlargeCenterPage: true,
          autoPlay: false,
        ),
        itemBuilder: (BuildContext context, int index, int realIndex) {
          return Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                    20.0), // Ajusta el radio de acuerdo a tu preferencia
                child: YoutubePlayer(
                  controller: _controllers[index],
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.red,
                  progressColors: ProgressBarColors(
                    playedColor: Colors.red,
                    handleColor: Colors.red,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                videoTitles[index],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  final List<Map<String, String>> imgList = [
    {
      "url":
          "https://drive.google.com/uc?export=view&id=1StQmyRpH3ys4u0nI9rMY2ydYXvjWTxnp",
      "info":
          "Destacan las famosas gorditas, el cabrito en su sangre, nopales con pipián, flor de calabaza, chochas guisadas, jacubes y cecina. Los dulces de calabaza, chilacayote y piloncillo guisado, así como la miel de maguey. Visita la categoría “Gastronomía” para conocer más.",
      "name": "Gastronomía en Jaumave"
    },
    {
      "url":
          "https://drive.google.com/uc?export=view&id=1goIIBoYHhSIjYFW-yUkrCFKDUvLJnwe9",
      "info":
          "En el año 1903 se acordó plantar los centenarios ahuehuetes que se admiraban pasando el canal de la Ciénaga. Representa una entrada al municipio cuando se recorre la carretera 101 de norte a sur, además de ser un sitio ideal para una foto de recuerdo.",
      "name": "Los Sabinos"
    },
    {
      "url":
          "https://drive.google.com/uc?export=view&id=1Unybax_iv-ZVGwI5VMmTDUpQ_NpnsNLe",
      "info":
          "En 1904 había 17 haciendas, daban ocupación a más de 1400 hombres, los principales cultivos eran de maíz, frijol, caña de azúcar, arroz, café y textiles como el henequén y la lechuguilla, las más importantes eran: \n\n-Hacienda de los Saldaña\n-Hacienda Calabazas,\n-El Centinela\n-Los Ébanos\n-La Huasacana y San Vicente\n-La Joya de Salas\n-El Ingenio (Los Adobes)\n-La Maroma\n-Montecristo Carabanchel y Bucareli\n-La Mula\n-La Puente y San Juan de Oriente\n-Santiaguillo y la Meca Vieja.",
      "name": "Haciendas de Jaumave"
    },
    {
      "url":
          "https://drive.google.com/uc?export=view&id=1PvoH6QUuKi5PMq-mRrpcAADqD4RUN36C",
      "info":
          "Los productos artesanales típicos de esta región, son confeccionados de la fibra que se extrae de la lechuguilla, comúnmente llamada Ixtle, como reatas, bolsas de mano, morrales, escobetillas y cables para diversos usos; también se hacen variedad de artículos de esta actividad llamada jarcería, sin faltar las personas que se dedican a la elaboración de comales y ollas de barro. En algunos ejidos la explotación forestal elaboran artesanías de tallado de madera. Consulta la categoría “Artesanías” para más información. ",
      "name": "Artesanías en Jaumave"
    },
    {
      "url":
          "https://img.optimalcdn.com/www.posta.com.mx/2024/02/a9658bb8d2c94cdd0b8a770c77e711494862393b/1755_Ataque_de_indios_janambres.webp",
      "info":
          "La mayor parte de los cronistas afirma que los Janambres eran nómadas y que eran naturalmente recolectores y cazadores, veían a los indígenas agricultores de forma despectiva, tales como los Pisones y Mariguanes. Recolectaban raíces y frutos silvestres para alimentarse. Habitaba en el territorio ocupado actualmente por el estado mexicano de Tamaulipas, específicamente en la región suroeste de dicho estado. Habitaban las llanuras entre la Sierra Madre Oriental y la sierra de Tamaulipas al este.",
      "name": "Los Janambres"
    },
    // Agrega más imágenes aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 255, 242),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 212, 255, 242),
        title: Text(
          'Datos y Curiosidades',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            aspectRatio: 1, // Relación de aspecto 1:1 para que sea cuadrada
            enlargeCenterPage: false,
            enableInfiniteScroll: true,
            autoPlay: true,
            viewportFraction: 0.5,
          ),
          items: imgList
              .map((item) => GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(item["name"]!),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: item["url"]!,
                                  fit: BoxFit.cover,
                                  width: 300,
                                  height: 200,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                                SizedBox(height: 16),
                                Text(item["info"]!),
                              ],
                            ),
                            actions: [
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
                    child: Column(
                      children: [
                        ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: item["url"]!,
                            fit: BoxFit.cover,
                            width: 150,
                            height: 150,
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          item["name"]!,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String imageUrl =
      'https://drive.google.com/uc?export=view&id=14ynuhIZjOpJJW8ezseyCcepEOV_ZPPU_';
  final String mapUrl =
      'https://www.google.com/maps/search/?api=1&query=23.4120243284565,-99.37968516770518';

  void _showInformationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 16,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image.network(
                  'https://gadm.org/img/480/gadm/MEX/tamaulipas/jaumave/MEX_tamaulipas_jaumave_adm2.png',
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 16),
                Text(
                  'Localización del municipio',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Jaumave, enclavado en la Sierra Madre Oriental, representa el 3.33% del total del Estado. El Municipio colinda al norte con el de Güemez, al noreste con el Estado de Nuevo León y el Municipio de Miquihuana, al noroeste con el de Victoria, al sur con el de Ocampo, al sureste con el de Gómez Farías al suroeste con el de Palmillas y al este con el de Llera. La cabecera Municipal se encuentra en la ciudad de Jaumave, situada geográficamente a 23º24´ latitud norte y 99º 24´de longitud oeste a una altura de 735 mts. sobre el nivel del mar.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cerrar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _launchMapUrl() async {
    if (await canLaunch(mapUrl)) {
      await launch(mapUrl);
    } else {
      throw 'No se pudo abrir $mapUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 255, 242),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 212, 255, 242),
        title: Text(
          'Ubicación / Location',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 28),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 175,
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: _launchMapUrl,
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.6),
                                spreadRadius: -8,
                                blurRadius: 12,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () => _showInformationDialog(context),
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ModelosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 255, 242),
      appBar: AppBar(
        title: Text(
          'Descubre Jaumave con RA',
          textAlign: TextAlign.left,
          style: TextStyle(
              fontSize: 20,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        backgroundColor: Color.fromARGB(255, 212, 255, 242),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomImage(
                imageUrl:
                    'https://drive.google.com/uc?export=view&id=1MfCTjXnOuKehYnXo18S7JUX4Oo47n6dO',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => mariposa()),
                ),
              ),
              CustomImage(
                imageUrl:
                    'https://drive.google.com/uc?export=view&id=11coZvUbSNU_SxFAXxIA5LY3BGW0frhWt',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => cardenal()),
                ),
              ),
              // Añade más imágenes según sea necesario
            ],
          ),
        ),
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;

  CustomImage({required this.imageUrl, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: 150.0,
        height: 150.0,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                imageUrl,
                width: 150.0,
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 40.0,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0)),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.4),
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TiendaArtesanias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 212, 255, 242),
      //appBar: AppBar(),
      body: Center(
        child: ImageWithInfoButton(
          imageUrl:
              'https://drive.google.com/uc?export=view&id=1gJy3HiWbkQGSix6U6n9m1FDI7ndmalnL',
          buttonText: 'Conoce los productos',
          titles: [
            'Talabartería',
            'Pintura',
            'Fibras vegetales',
            'Cantería',
            'Textiles',
            'Madera',
            'Arte Huichol',
            'Alimentos',
            'Uso Personal',
            'Concha y caracol'
          ],
          imageUrls: [
            'https://drive.google.com/uc?export=view&id=1vlbasg6kN_9kgrR4KzVJBSJo7u-Qhu4U',
            'https://drive.google.com/uc?export=view&id=1Mn94bWSqvh-PMyI-rInNhU2u3q9afal7',
            'https://drive.google.com/uc?export=view&id=1vAS5e_DqVwA_aMQcqG115r94K8cdF3wD',
            'https://drive.google.com/uc?export=view&id=1_aVnTvLVF1yuglvNcFQHgPVZ3Yb915X9',
            'https://drive.google.com/uc?export=view&id=1yE9wHtGGkTLqfKYSqXk5u8_nQ3_En8Na',
            'https://drive.google.com/uc?export=view&id=1-zxS7nRn2Vt8tdZTUk-saBbxUb4f5IzL',
            'https://drive.google.com/uc?export=view&id=131PkSrgv_lpcr0yGeMJRzkvJrVB3ZsJC',
            'https://drive.google.com/uc?export=view&id=1rm4zIp657FyUd41RmrN4cik9zxDdlT-v',
            'https://drive.google.com/uc?export=view&id=1qr0n30dAfdCjNwW6KADK5mjI6xmnJnQX',
            'https://drive.google.com/uc?export=view&id=12HdAOCv7IEZcF3mNXw4RDMKDZ7SuQ1ZT'
          ],
          facebookUrl:
              'https://www.facebook.com/profile.php?id=100088940547860&locale=es_LA',
        ),
      ),
    );
  }
}

class ImageWithInfoButton extends StatelessWidget {
  final String imageUrl;
  final String buttonText;
  final List<String> titles;
  final List<String> imageUrls;
  final String facebookUrl;

  ImageWithInfoButton({
    required this.imageUrl,
    required this.buttonText,
    required this.titles,
    required this.imageUrls,
    required this.facebookUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 10.0), // Añadir padding horizontal
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => _launchURL(facebookUrl),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
              child: Image.network(
                imageUrl,
                width: MediaQuery.of(context).size.width,
                height: 230,
                fit: BoxFit.cover, // Ajustar la imagen al contenedor
              ),
            ),
          ),
          Positioned(
            top: 8.0,
            right: 8.0,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white70,
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              ),
              onPressed: () => _showInfoDialog(context),
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: SwiperWidget(titles: titles, imageUrls: imageUrls),
        );
      },
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class SwiperWidget extends StatelessWidget {
  final List<String> titles;
  final List<String> imageUrls;

  SwiperWidget({required this.titles, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      child: Swiper(
        itemCount: imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(imageUrls[index],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context)
                        .size
                        .width /*width: double.infinity*/),
              ),
              Positioned(
                bottom: 25.0,
                left: 8.0,
                child: Text(
                  titles[index],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ],
          );
        },
        pagination: SwiperPagination(),
        control: SwiperControl(),
      ),
    );
  }
}

