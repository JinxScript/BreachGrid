import 'package:flutter/material.dart';
import '../../../core/utils/grid_painter.dart' show GridPainter;
import '../../../core/utils/coordinate_system.dart';

class MapWidget extends StatelessWidget {
  final String mapImagePath;
  final double mapWidth;
  final double mapHeight;

  const MapWidget({
    Key? key,
    required this.mapImagePath,
    this.mapWidth = 600.0, // Default map size
    this.mapHeight = 600.0, // Default map size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final coordinateSystem = CoordinateSystem(
      mapWidth: mapWidth,
      mapHeight: mapHeight,
    );

    return Stack(
      children: [
        // Mesh grid background (always visible)
        CustomPaint(size: Size.infinite, painter: GridPainter()),
        // Interactive map with zoom and pan
        InteractiveViewer(
          boundaryMargin: const EdgeInsets.all(double.infinity),
          minScale: 0.5,
          maxScale: 8.0, // Increased max zoom level
          child: Center(
            child: Stack(
              children: [
                // Map image
                GestureDetector(
                  onTapDown: (details) {
                    final localPosition = details.localPosition;
                    final mapCoordinates = coordinateSystem.screenToMap(
                      localPosition.dx,
                      localPosition.dy,
                      mapWidth,
                      mapHeight,
                    );
                    print(
                      'Map Coordinates: x=${mapCoordinates['x']}, y=${mapCoordinates['y']}',
                    );
                  },
                  child: Image.asset(
                    mapImagePath,
                    fit: BoxFit.contain,
                    width: mapWidth, // Directly set width
                    height: mapHeight, // Directly set height
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
