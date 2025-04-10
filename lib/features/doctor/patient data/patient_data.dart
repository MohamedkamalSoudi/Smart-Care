import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/patient%20data/widgets/patient_data_page.dart';

class PatientData extends StatelessWidget {
  const PatientData({super.key});
static const id = 'PatientData';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PatientDataPage(),
    );
  }
}