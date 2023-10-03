import 'dart:ui';

import 'package:flutter/material.dart';

class HomeHero extends StatelessWidget {
  final String currentTemp;
  final IconData icon;
  final String weatherCondition;

  const HomeHero({
    super.key,
    required this.currentTemp,
    required this.icon,
    required this.weatherCondition,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  currentTemp,
                  style: const TextStyle(fontSize: 32),
                ),
                const SizedBox(
                  height: 16,
                ),
                Icon(
                  icon,
                  size: 64,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  weatherCondition,
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
