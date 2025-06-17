import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'custom_notification_button.dart';
import 'room_number_and_bed_number.dart';

class CustomCard extends StatelessWidget {
  final String patientName;
  final String roomNumber;
  final String ped;
  final String time;
  final String date;
  final String titel;
  final int patientId;
  final VoidCallback? onWaiting;
  final VoidCallback? onComplete;

  const CustomCard({
    super.key,
    required this.patientName,
    required this.roomNumber,
    required this.ped,
    required this.time,
    required this.date,
    required this.titel,
    required this.patientId,
    this.onWaiting,
    this.onComplete,
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
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(patientName),
              RoomNumberAndBedNumber(roomNumber: roomNumber, ped: ped),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Color(0xff9ADCF6),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Text(
                  titel,
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

          const SizedBox(height: 20),
          Row(
            children: [
              if (onWaiting != null)
                Expanded(
                  child: CustomNotificationButton(
                    text: 'Waiting',
                    isColored: false,
                    onTap: onWaiting!,
                  ),
                ),
              if (onWaiting != null && onComplete != null)
                const SizedBox(width: 20),
              if (onComplete != null)
                Expanded(
                  child: CustomNotificationButton(
                    text: 'Complete',
                    isColored: true,
                    onTap: onComplete!,
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}
