import 'package:flutter/material.dart';
import '../../../core/utils/grid_painter.dart' show GridPainter;
import '../../../core/utils/coordinate_system.dart';
import '../../map/widgets/map_dropdown.dart';
import '../../map/widgets/floor_tab_bar.dart';

class MapWidget extends StatelessWidget {
  final String mapImagePath;
  final double mapWidth;
  final double mapHeight;

  const MapWidget({
    super.key,
    required this.mapImagePath,
    this.mapWidth = 600.0, // Default map size
    this.mapHeight = 600.0, // Default map size
  });

  @override
  Widget build(BuildContext context) {
    final coordinateSystem = CoordinateSystem(
      mapWidth: mapWidth,
      mapHeight: mapHeight,
    );

    return Scaffold(
      body: Stack(
        children: [
          // Mesh grid background
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

          // Custom Top Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: const Color(0xFF7289DA), // Background color for the bar
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Map Dropdown
                  MapDropdown(
                    selectedMap: 'Clubhouse',
                    onMapChanged: () {
                      print('Map changed');
                    },
                  ),

                  // Floor Tabs
                  FloorTabBar(
                    selectedFloor: 'Basement',
                    floors: ['Basement', '1F', '2F', 'Roof'],
                    onFloorChanged: (floor) {
                      print('Floor changed to $floor');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
