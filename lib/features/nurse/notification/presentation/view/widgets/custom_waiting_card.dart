import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'custom_notification_button.dart';
import 'room_number_and_bed_number.dart';

class CustomWaitingCard extends StatelessWidget {
  final String patientName;
  final String roomNumber;
  final String ped;
  final String time;
  final String date;
  final VoidCallback onComplete;

  const CustomWaitingCard({
    super.key,
    required this.patientName,
    required this.roomNumber,
    required this.ped,
    required this.time,
    required this.date,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final String todayDate = DateFormat('EEEE, MMM d').format(DateTime.now());
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.transparent,
        border: Border.all(width: 2, color: const Color(0xff4DADFB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                patientName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              RoomNumberAndBedNumber (roomNumber: roomNumber, ped: ped),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xff9ADCF6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
              SizedBox(width: 5),
              Text(date),
              Spacer(),
              Icon(Icons.settings_backup_restore,), 
              Text(todayDate),
            ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: CustomNotificationButton(
                  text: 'Complete',
                  isColored: true,
                  onTap: onComplete,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
