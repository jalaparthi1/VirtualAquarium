import 'package:flutter/material.dart';
import 'dart:math';

class Fish {
  Color color; // Color can now be changed
  final double speed;
  Offset position;
  Random random = Random();
  double size; // Fish size for scaling effect

  Fish({required this.color, required this.speed})
      : position = Offset(150, 150), // Initial position in the center
        size = 20.0; // Initial size of the fish

  void moveFish(double maxWidth, double maxHeight) {
    // Move the fish and check for boundary collisions
    double dx = random.nextDouble() * 2 - 1;
    double dy = random.nextDouble() * 2 - 1;
    position = Offset(position.dx + dx * speed, position.dy + dy * speed);

    // Boundary check and reverse direction if needed
    if (position.dx < 0 || position.dx > maxWidth - size) {
      dx = -dx;
    }
    if (position.dy < 0 || position.dy > maxHeight - size) {
      dy = -dy;
    }

    position = Offset(position.dx + dx * speed, position.dy + dy * speed);
  }

  void changeDirection() {
    // Randomly change the direction of the fish
    double dx = random.nextDouble() * 2 - 1;
    double dy = random.nextDouble() * 2 - 1;
    position = Offset(position.dx + dx * speed, position.dy + dy * speed);
  }

  void grow() {
    // Slightly increase the size of the fish when added
    size += 2.0;
  }

  Widget buildFish() {
    return Positioned(
      left: position.dx,
      top: position.dy,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
