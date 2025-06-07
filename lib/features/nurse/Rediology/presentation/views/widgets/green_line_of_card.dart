import 'package:flutter/material.dart';

class GreenLineOfCard extends StatelessWidget {
  final bool isDone;

  const GreenLineOfCard({super.key, required this.isDone});

  @override
  Widget build(BuildContext context) {
    final Color lineColor = isDone ? Colors.green : Colors.orange;

    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 16, bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          width: 4,
          height: double.infinity,
          color: lineColor,
        ),
      ),
    );
  }
}
