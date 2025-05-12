import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';

class ReminderTimesSection extends StatelessWidget {
  final TimeOfDay? time1;
  final TimeOfDay? time2;
  final Function({required bool isFirst, required TimeOfDay newTime}) onTimeChanged;

  const ReminderTimesSection({
    super.key,
    required this.time1,
    required this.time2,
    required this.onTimeChanged,
  });

  Future<void> _selectTime(BuildContext context, bool isFirst) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      onTimeChanged(isFirst: isFirst, newTime: picked);
    }
  }

  Widget timeRow({
    required BuildContext context,
    required String label,
    required TimeOfDay? time,
    required bool isFirst,
  }) {
    return Row(
      children: [
        Container(
          width: 140,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(Icons.access_time, color: AppColors.blue),
              const SizedBox(width: 6),
              Text(label),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: InkWell(
            onTap: () => _selectTime(context, isFirst),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  time != null ? time.format(context) : "--:--",
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Set Reminder Times",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 10),
        timeRow(
          context: context,
          label: "Time 1",
          time: time1,
          isFirst: true,
        ),
        const SizedBox(height: 12),
        timeRow(
          context: context,
          label: "Time 2",
          time: time2,
          isFirst: false,
        ),
      ],
    );
  }
}
