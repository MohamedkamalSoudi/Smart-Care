import 'package:flutter/material.dart';

import 'view/widgets/add_new_prescription_viwe_body.dart';
class AddNewPrescriptionNurse extends StatelessWidget {
  const AddNewPrescriptionNurse({super.key});
  static const id = 'AddNewPrescriptionNurse';
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      body:
      AddNewPrescriptionViweBodyNurse(),
    );
  }
}