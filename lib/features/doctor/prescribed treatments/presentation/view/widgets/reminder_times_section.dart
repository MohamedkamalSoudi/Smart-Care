import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';

class ReminderTimesSection extends StatefulWidget {
  final int maxTimes; 
  final List<TimeOfDay?> times; 
  final Function(int, TimeOfDay) onTimeChanged;

  const ReminderTimesSection({
    super.key,
    required this.maxTimes,
    required this.times,
    required this.onTimeChanged,
  });

  @override
  State<ReminderTimesSection> createState() => _ReminderTimesSectionState();
}

class _ReminderTimesSectionState extends State<ReminderTimesSection> {
  late int timeCounter;

  @override
  void initState() {
    timeCounter = widget.maxTimes;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ReminderTimesSection oldWidget) {
    if (oldWidget.maxTimes != widget.maxTimes) {
      setState(() {
        timeCounter = widget.maxTimes;
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  Future<void> _selectTime(int index) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: widget.times[index] ?? TimeOfDay.now(),
    );
    if (picked != null) {
      widget.onTimeChanged(index, picked);
    }
  }

  String formatTimeOfDayTo24Hour(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute:00';
  }

  Widget _buildTimeRow(int index) {
    final time = widget.times[index];
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
              Text("Time ${index + 1}"),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: InkWell(
            onTap: () => _selectTime(index),
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  time != null ? formatTimeOfDayTo24Hour(time) : "--:--:--",
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
        for (int i = 0; i < timeCounter && i < widget.times.length; i++) ...[
          _buildTimeRow(i),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}
