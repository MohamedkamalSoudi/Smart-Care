import 'package:flutter/material.dart';

class TopInfoWidgetNurse extends StatelessWidget {
  final String name;
  final int age;
  final String patientId;

  const TopInfoWidgetNurse(
      {super.key,
      required this.name,
      required this.age,
      required this.patientId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Age: $age',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: EdgeInsets.all(8),
            child: Text(patientId, style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
