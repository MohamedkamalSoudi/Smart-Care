import 'package:flutter/material.dart';
import 'package:smart_care_app/features/splash/presentation/home/widgets/patients_data.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;

  const PatientCard({Key? key, required this.patient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap on patient card (e.g., navigate to details)
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(patient.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('Room: ${patient.room}'),
                    Text('Bed number: ${patient.bedNumber}'),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/Patient in ward with doctors.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}