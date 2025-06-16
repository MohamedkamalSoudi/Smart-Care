import 'package:flutter/material.dart';
import 'custom_notification_button.dart';
import 'room_number_and_bed_number.dart';
import 'time_container.dart';

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
          // المريض وبيانات الغرفة
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(patientName),
              RoomNumberAndBedNumber(roomNumber: roomNumber, ped: ped),
            ],
          ),
          const SizedBox(height: 20),
          // الوقت والعنوان
          TimeContainer(date: date, titel: titel),
          const SizedBox(height: 20),
          // الأزرار
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
