import 'package:flutter/material.dart';

class TimesPerDaySelector extends StatelessWidget {
  final int timesPerDay;
  final Function(int) onChanged;

  const TimesPerDaySelector({
    super.key,
    required this.timesPerDay,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 150,
          height: 45,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  if (timesPerDay > 1) onChanged(timesPerDay - 1);
                },
                child: Icon(Icons.remove, color: Colors.black54),
              ),
              Text(
                '$timesPerDay',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () {
                  if (timesPerDay < 3) onChanged(timesPerDay + 1);
                },
                child: Icon(Icons.add, color: Colors.black54),
              ),
            ],
          ),
        ),
        SizedBox(width: 12),
        Text("A Time", style: TextStyle(fontSize: 20)),
      ],
    );
  }
}