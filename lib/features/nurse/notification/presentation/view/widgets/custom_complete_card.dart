import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'room_number_and_bed_number.dart';

class CustomCompleteCard extends StatelessWidget {
  final String name;
  final String roomNumber;
  final String time;
  final String patientName;
  final String ped;
  final String date;

  const CustomCompleteCard({
    super.key,
    required this.name,
    required this.roomNumber,
    required this.time,
    required this.patientName,
    required this.ped,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final String todayDate = DateFormat('EEEE, MMM d').format(DateTime.now());
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        border: Border.all(width: 2, color: Color(0xff4DADFB)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name),
              RoomNumberAndBedNumber(roomNumber: roomNumber, ped: ped),
            ],
          ),
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xff9ADCF6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black, 
                  ),
                ),
                Spacer(),
                Icon(Icons.settings_backup_restore,), 
                Text(
                  todayDate,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
