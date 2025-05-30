import 'package:flutter/material.dart';

import 'room_number_and_bed_number.dart';
import 'time_container.dart';

class CustomCompleteCard extends StatelessWidget {
  const CustomCompleteCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          border: Border.all(width: 2, color: Color(0xff4DADFB))),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Ahmed yousef'),
              RoomNumberAndBedNumber(),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          TimeContainer(),
          SizedBox(
            height: 20,
          ),
         
        ],
      ),
    );
  }
}
