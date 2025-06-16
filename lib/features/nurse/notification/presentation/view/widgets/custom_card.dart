import 'package:flutter/material.dart';

import 'custom_notification_button.dart';
import 'room_number_and_bed_number.dart';
import 'time_container.dart';

class CustomCard extends StatelessWidget {
  final String patientName;
  final String roomNumber;
  final String ped;
  final String time;
  const CustomCard(
      {super.key,
      required this.patientName,
      required this.roomNumber,
      required this.ped,
      required this.time});

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
              Text(patientName),
              RoomNumberAndBedNumber(
                roomNumber: roomNumber,
                ped: ped,
              ),
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
