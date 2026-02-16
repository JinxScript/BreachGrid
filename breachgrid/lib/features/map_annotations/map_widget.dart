import 'package:flutter/material.dart';
import '../../core/utils/coordinate_system.dart';

class MapWidget extends StatelessWidget {
  final String mapImagePath;
  final double mapWidth;
  final double mapHeight;

  const MapWidget({
    Key? key,
    required this.mapImagePath,
    required this.mapWidth,
    required this.mapHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final screenHeight = constraints.maxHeight;

        final coordinateSystem = CoordinateSystem(
          mapWidth: mapWidth,
          mapHeight: mapHeight,
        );

        return GestureDetector(
          onTapDown: (details) {
            final localPosition = details.localPosition;
            final mapCoordinates = coordinateSystem.screenToMap(
              localPosition.dx,
              localPosition.dy,
              screenWidth,
              screenHeight,
            );
            print(
              'Map Coordinates: ${mapCoordinates['x']}, ${mapCoordinates['y']}',
            );
          },
          child: Image.asset(
            mapImagePath,
            fit: BoxFit.cover,
            width: screenWidth,
            height: screenHeight,
          ),
        );
      },
    );
  }
}
