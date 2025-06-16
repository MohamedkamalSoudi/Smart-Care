import 'package:flutter/material.dart';

class TimeContainer extends StatelessWidget {
  final String date;
  final String titel;
  const TimeContainer({
    super.key,
    required this.date,
    required this.titel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xff9ADCF6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(titel),
          Spacer(),
          Icon(Icons.settings_backup_restore),
          Text(date),
        ],
      ),
    );
  }
}
