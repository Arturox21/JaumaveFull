import 'package:flutter/material.dart';
import 'package:mave/paginas/home.dart';
import 'package:mave/paginas/prueba.dart';
//import 'package:mave/paginas/enlaceredes.dart';

void main() => runApp(const MyApp());
/*void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mave',
        routes: {
          '/ruta_categoria1': (context) => const Categoria1Screen(),
        },
        //home: const Social());
        home: const HomePage());
  }
}
