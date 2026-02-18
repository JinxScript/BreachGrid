import 'package:flutter/material.dart';

// ─── Single Tab Button ────────────────────────────────────────────────────────
// This is the individual button, e.g. "Basement" or "Roof"
// We build this separately so FloorTabBar can just loop over them

class FloorTabButton extends StatelessWidget {
  final String label;
  final bool isSelected; // is this the currently active floor?
  final VoidCallback onTap;

  const FloorTabButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          // selected tab is darker so it stands out
          color: isSelected ? const Color(0xFF3A4A8A) : const Color(0xFF5B6EAE),
          borderRadius: BorderRadius.circular(8.0),
          border: isSelected
              ? Border.all(color: Colors.white, width: 1.5)
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

// ─── Floor Tab Bar ────────────────────────────────────────────────────────────
// This holds all the floor buttons in a Row with spacing between them

class FloorTabBar extends StatelessWidget {
  final String selectedFloor;
  final List<String> floors;
  final Function(String)
  onFloorChanged; // tells the parent which floor was tapped

  const FloorTabBar({
    super.key,
    required this.selectedFloor,
    required this.floors,
    required this.onFloorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // only take up as much space as needed
      children: floors.map((floor) {
        // for every floor in the list, build a button
        // and add spacing between them (but not after the last one)
        final isLast = floor == floors.last;

        return Row(
          children: [
            FloorTabButton(
              label: floor,
              isSelected: floor == selectedFloor, // highlight if it matches
              onTap: () => onFloorChanged(floor), // tell parent what was tapped
            ),
            if (!isLast) const SizedBox(width: 8), // gap between buttons
          ],
        );
      }).toList(),
    );
  }
}
