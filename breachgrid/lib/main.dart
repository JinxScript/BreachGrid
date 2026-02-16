import 'package:flutter/material.dart';
import 'features/map_annotations/map_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Map Viewer')),
        body: MapWidget(
          mapImagePath:
              'assets/images/maps/clubhouse/basement/r6-maps-clubhouse-blueprint-1.png',
          mapWidth: 1000, // Replace with your map's width
          mapHeight: 1000, // Replace with your map's height
        ),
      ),
    );
  }
}
