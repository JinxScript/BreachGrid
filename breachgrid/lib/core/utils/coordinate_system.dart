class CoordinateSystem {
  final double mapWidth;
  final double mapHeight;

  CoordinateSystem({required this.mapWidth, required this.mapHeight});

  Map<String, double> screenToMap(
    double screenX,
    double screenY,
    double screenWidth,
    double screenHeight,
  ) {
    double mapX = (screenX / screenWidth) * mapWidth;
    double mapY = (screenY / screenHeight) * mapHeight;
    return {'x': mapX, 'y': mapY};
  }

  Map<String, double> mapToScreen(
    double mapX,
    double mapY,
    double screenWidth,
    double screenHeight,
  ) {
    double screenX = (mapX / mapWidth) * screenWidth;
    double screenY = (mapY / mapHeight) * screenHeight;
    return {'x': screenX, 'y': screenY};
  }
}
