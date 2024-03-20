import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class mariposa extends StatelessWidget {
  const mariposa({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: ModelViewer(src: 'assets/mariposa.glb', ar: true));
  }
}
