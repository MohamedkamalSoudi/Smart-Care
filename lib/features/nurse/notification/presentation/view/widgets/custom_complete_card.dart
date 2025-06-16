import 'package:flutter/material.dart';

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
              Text("Room $roomNumber"),
            ],
          ),
          SizedBox(height: 20),
          Text("Time: $time"),
        ],
      ),
    );
  }
}
