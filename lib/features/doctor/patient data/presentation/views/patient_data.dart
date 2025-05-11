import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/home/data/patient_model.dart';
import 'widgets/patient_data_page.dart';

class PatientData extends StatelessWidget {
  final UserModel model;
  const PatientData({super.key, required this.model});
  static const id = 'PatientData';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PatientDataPage(
        model: model,
      ),
    );
  }
}
