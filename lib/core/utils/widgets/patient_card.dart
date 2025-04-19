import 'package:flutter/material.dart';
import 'package:smart_care_app/core/app_colors.dart';
import 'package:smart_care_app/features/doctor/patient%20data/presentation/views/patient_data.dart';

import '../../../features/doctor/home/data/patient_model.dart';

class PatientCard extends StatelessWidget {
  final Patient patient;

  const PatientCard({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PatientData.id);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 5),
        decoration: BoxDecoration(
          color: AppColors.whitebody,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(2, 2), 
              blurRadius: 1,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
          child: Row(
            children: [
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(patient.name,
                        style: TextStyle(color: AppColors.textcardhome)),
                    Text('Room: ${patient.room}',
                        style: TextStyle(color: AppColors.textcardhome)),
                    Text('Bed number: ${patient.bedNumber}',
                        style: TextStyle(color: AppColors.textcardhome)),
                  ],
                ),
              ),
              Image.asset(
                'assets/images/Patient in ward with doctors.png',
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
