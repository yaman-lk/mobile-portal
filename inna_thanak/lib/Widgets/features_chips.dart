import 'package:flutter/material.dart';

class FeaturedChip extends StatelessWidget {
  final String label;
  final Color color;

  FeaturedChip(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        this.label,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      backgroundColor: this.color,
    );
  }
}
