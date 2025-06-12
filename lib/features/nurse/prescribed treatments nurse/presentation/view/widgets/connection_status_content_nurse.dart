import 'package:flutter/material.dart';

class ConnectionStatusContentNurse extends StatelessWidget {
  final String name;
  final String connectionType;
  final String message;
  final String timestamp;
  final String date;

  const ConnectionStatusContentNurse({
    super.key,
    required this.connectionType,
    required this.message,
    required this.timestamp,
    required this.date, 
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          name,
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