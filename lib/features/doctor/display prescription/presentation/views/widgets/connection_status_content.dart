import 'package:flutter/material.dart';

class ConnectionStatusContent extends StatelessWidget {
  final String connectionType;
  final String message;
  final String timestamp;
  final String date;

  const ConnectionStatusContent({
    super.key,
    required this.connectionType,
    required this.message,
    required this.timestamp,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'C-Vitrase',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          connectionType,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          message,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '$timestamp - $date',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black38,
          ),
        ),
      ],
    );
  }
}