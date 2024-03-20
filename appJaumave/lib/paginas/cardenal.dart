import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class cardenal extends StatelessWidget {
  const cardenal({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ModelViewer(src: 'assets/cardenal.glb', ar: true));
  }
}
