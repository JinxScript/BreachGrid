import 'package:flutter/material.dart';

class MapDropdown extends StatelessWidget {
  final String selectedMap;
  final VoidCallback onMapChanged;

  // The list of available maps
  static const List<String> maps = [
    'Clubhouse',
    'Bank',
    'Border',
    'Chalet',
    'Consulate',
    'Kafe',
    'Oregon',
    'Villa',
  ];

  const MapDropdown({
    super.key,
    required this.selectedMap,
    required this.onMapChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: const Color(0xFF5B6EAE), // slightly darker blue than the bar
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedMap,
          dropdownColor: const Color(0xFF5B6EAE),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          onChanged: (String? newValue) {
            // Right now this just calls the callback
            // Later you'll pass the newValue up to the parent
            onMapChanged();
          },
          items: maps.map((String map) {
            return DropdownMenuItem<String>(value: map, child: Text(map));
          }).toList(),
        ),
      ),
    );
  }
}
