import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'map_dropdown.dart';
import 'floor_tab_bar.dart';

class MapNavBar extends StatelessWidget {
  final String selectedMap;
  final String selectedFloor;
  final List<String> floors;
  final VoidCallback onMapChanged;
  final Function(String) onFloorChanged;

  const MapNavBar({
    Key? key,
    required this.selectedMap,
    required this.selectedFloor,
    required this.floors,
    required this.onMapChanged,
    required this.onFloorChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF7289DA), // Background color for the nav bar
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Home SVG Icon
          SvgPicture.asset(
            'assets/icons/home.svg',
            width: 24.0,
            height: 24.0,
            color: Colors.white,
          ),

          // Map Dropdown
          MapDropdown(selectedMap: selectedMap, onMapChanged: onMapChanged),

          // Floor Tabs
          FloorTabBar(
            selectedFloor: selectedFloor,
            floors: floors,
            onFloorChanged: onFloorChanged,
          ),
        ],
      ),
    );
  }
}
