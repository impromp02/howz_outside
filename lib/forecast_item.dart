import 'package:flutter/material.dart';

class ForecastItem extends StatelessWidget {
  final IconData icon;
  final String hour;
  final String temp;

  const ForecastItem(
      {super.key, required this.icon, required this.hour, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: SizedBox(
        width: 100,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Text(
                hour,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 6,
              ),
              Icon(
                icon,
                size: 28,
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                temp,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
