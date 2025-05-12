import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/prescribed%20treatments/presentation/view/widgets/add_new_prescription_viwe_body.dart';
class AddNewPrescription extends StatelessWidget {
  const AddNewPrescription({super.key});
  static const id = 'AddNewPrescription';
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body:
      AddNewPrescriptionViweBody(),
    );
  }
}