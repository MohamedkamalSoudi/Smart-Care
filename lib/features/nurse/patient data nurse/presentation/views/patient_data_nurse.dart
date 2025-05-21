import 'package:flutter/material.dart';
import 'package:smart_care_app/features/nurse/home/data/patient_nurse_model.dart';
import 'widgets/patient_data_page_nurse.dart';

class PatientDataNurse extends StatelessWidget {
  final UserModelNurse model;
  const PatientDataNurse({super.key, required this.model});
  static const id = 'PatientDataNurse';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PatientDataPageNurse(
        model: model,
      ),
    );
  }
}
