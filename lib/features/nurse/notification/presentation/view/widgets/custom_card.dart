import 'package:flutter/material.dart';

import 'custom_notification_button.dart';
import 'room_number_and_bed_number.dart';
import 'time_container.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

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
          Row(
            children: [
              Expanded(
                  child: CustomNotificationButton(
                text: 'Waiting',
                isColored: false,
              )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: CustomNotificationButton(
                text: 'Completed',
                isColored: true,
              )),
            ],
          )
        ],
      ),
    );
  }
}
