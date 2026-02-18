import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/map_annotations/presentation/map_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: MapWidget(
          mapImagePath:
              'assets/images/maps/clubhouse/basement/r6-maps-clubhouse-blueprint-1.png',
          mapWidth: 300, // Replace with your map's width
          mapHeight: 300, // Replace with your map's height
        ),
      ),
    );
  }
}
