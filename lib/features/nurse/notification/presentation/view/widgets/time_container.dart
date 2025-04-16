import 'package:flutter/material.dart';

class TimeContainer extends StatelessWidget {
  const TimeContainer({
    super.key,
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
          Text('Saturday, Nov 22'),
          Spacer(),
          Icon(Icons.settings_backup_restore),
          Text(' Saturday, Nov 22'),
        ],
      ),
    );
  }
}
