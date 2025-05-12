
import 'package:flutter/material.dart';
import 'package:smart_care_app/features/nurse/home/data/patient_nurse_model.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/assets.dart';
import '../../../../patient data nurse/presentation/views/patient_data_nurse.dart';

class PatientCardNurse extends StatelessWidget {
  final UserModelNurse patient;

  const PatientCardNurse({super.key, required this.patient});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PatientDataNurse.id, arguments: patient);
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
                    Text('Name : ${patient.name!}',
                        style: TextStyle(color: AppColors.textcardhome)),
                    Text('Room: ${patient.room}',
                        style: TextStyle(color: AppColors.textcardhome)),
                    Text('Bed number: ${patient.bed}',
                        style: TextStyle(color: AppColors.textcardhome)),
                  ],
                ),
              ),
              Image.asset(
                AssetsData.patientandbed,
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
