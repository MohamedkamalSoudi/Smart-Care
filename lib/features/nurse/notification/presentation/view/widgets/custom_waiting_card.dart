import 'package:flutter/material.dart';
import 'custom_notification_button.dart';

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
          /// الاسم + الغرفة والسرير
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                patientName,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text('Room: $roomNumber | Bed: $ped'),
            ],
          ),
          const SizedBox(height: 20),

          /// الوقت والتاريخ
          Row(
            children: [
              const Icon(Icons.access_time, size: 18, color: Colors.grey),
              const SizedBox(width: 5),
              Text('$date - $time'),
            ],
          ),
          const SizedBox(height: 20),

          /// زر إنهاء
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
