import 'package:flutter/material.dart';
import 'package:mave/paginas/negocios.dart';
import 'package:mave/widgets/item.dart';
import 'DetailScreenComida.dart';
import 'package:mave/paginas/principal.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:convert';

class TurismoScreen extends StatefulWidget {
  const TurismoScreen({Key? key, required this.category}) : super(key: key);
  final Categoryy category;

  @override
  State<TurismoScreen> createState() => _TurismoScreenState();
}

class _TurismoScreenState extends State<TurismoScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  Future<List<dynamic>> getHospedaje() async {
    final response = await http.get(Uri.parse(
        'https://api.jaumaveonline.com:8463/api/post?section=Atractivos Turísticos'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      return data;
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    getHospedaje();
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    final Future<List<dynamic>> restaurantes = getHospedaje();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 212, 255, 242),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Atractivos Turísticos'.toUpperCase(),
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
      body: FutureBuilder<List<dynamic>>(
        future: restaurantes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError || snapshot.data == null) {
            return const Center(child: Text('Error al cargar datos'));
          } else {
            return Scaffold(
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10, horizontal: screenWidth / 25),
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            var restaurante = snapshot.data?[index];
                            return ItemWidget(
                              id: restaurante['_id'],
                              asset: restaurante['image'],
                              title: restaurante['title'],
                              desc: restaurante['details'],
                              fullDesc: restaurante['description'],
                              ubicacion: restaurante['location'],
                              coordenada: restaurante['map'],
                              contactos1: restaurante['contact'],
                              onFavoritePressed: () {
                                setState(() {
                                  snapshot.data?.removeAt(index);
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget item(
      String asset,
      String title,
      String desc,
      String fullDesc,
      String ubicacion,
      String coordenada,
      String contactos1,
      String contactos2,
      String contactos3) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailScreenComida(
              asset: asset,
              tag: title,
              fullDesc: desc,
              descoment: ubicacion,
              coord: coordenada,
              contacto1: contactos1,
              contacto2: contactos2,
              contacto3: contactos3,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: screenWidth / 20),
        child: Row(
          children: [
            Hero(
              tag: title,
              child: Container(
                width: screenWidth / 2.8,
                height: screenWidth / 2.8,
                margin: EdgeInsets.only(right: screenWidth / 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://api.jaumaveonline.com:8463/optimize/$asset",
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      fontSize: 20,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      desc,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
